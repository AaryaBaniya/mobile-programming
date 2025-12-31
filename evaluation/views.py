import json
try:
    import numpy as np
except ImportError:
    np = None  # Graceful fallback if Numpy is missing

from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required
from .models import Subject, Question, Attempt
from .forms import BCAStudentSignupForm

# ==========================================
# 1. AUTHENTICATION (Individual Records)
# ==========================================

def signup_view(request):
    if request.method == "POST":
        form = BCAStudentSignupForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect('dashboard')
    else:
        form = BCAStudentSignupForm()
    return render(request, 'registration/signup.html', {'form': form})

@login_required
def logout_view(request):
    logout(request)
    return redirect('login')

# ==========================================
# 2. MASTER DASHBOARD (Personalized Trends)
# ==========================================

@login_required
def dashboard(request):
    subjects = Subject.objects.all()
    subject_stats = []

    for sub in subjects:
        # Fetch history specific to THIS logged-in user for THIS subject
        attempts = Attempt.objects.filter(student=request.user, subject=sub).order_by('timestamp')
        latest = attempts.last()
        count = attempts.count()
        
        # Prepare data for the Chart.js line graph
        history_scores = [float(a.total_score) for a in attempts]
        history_labels = [f"Attempt {i+1}" for i in range(len(history_scores))]

        subject_stats.append({
            'info': sub,
            'latest': latest,
            'count': count,
            'chart_scores': json.dumps(history_scores),
            'chart_labels': json.dumps(history_labels),
        })

    return render(request, 'evaluation/dashboard.html', {
        'subject_stats': subject_stats,
    })

# ==========================================
# 3. STAGE 1: COMMON EVALUATION (20 Qs)
# ==========================================

@login_required
def start_common_test(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    # Corrected randomization attribute
    questions = Question.objects.filter(subject=subject, is_common=True).order_by('?')[:20]
    return render(request, 'evaluation/quiz_common.html', {'questions': questions, 'subject': subject})

@login_required
def submit_common(request, subject_id):
    if request.method == "POST":
        subject = get_object_or_404(Subject, id=subject_id)
        score = 0
        user_selections = {}

        for key, value in request.POST.items():
            if key.startswith('q_'):
                q_id = key.split('_')[1]
                question = Question.objects.get(id=q_id)
                user_selections[q_id] = value
                if question.correct_option == value:
                    score += 1
        
        # Tiered Level Logic (The Gatekeeper)
        if score < 11:
            level_queue = ['easy', 'medium', 'hard']
            msg = f"Since your score is {score}/20, you must clear all tiers: Easy, Medium, and Hard."
        elif 11 <= score <= 17:
            level_queue = ['medium', 'hard']
            msg = f"Good effort! With {score}/20, you bypassed Easy. You must clear Medium and Hard."
        else:
            level_queue = ['hard']
            msg = f"Excellent! With {score}/20, you are fast-tracked directly to the Hard Level."
            
        # Store test state in Session
        request.session['cumulative_score'] = score
        request.session['common_score_only'] = score
        request.session['level_queue'] = level_queue
        request.session['logic_msg'] = msg
        request.session['user_answers'] = user_selections
        
        return redirect('intermediate_results', subject_id=subject.id)

# ==========================================
# 4. REVIEW & INTERMEDIATE FEEDBACK
# ==========================================

@login_required
def intermediate_results(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    queue = request.session.get('level_queue', [])
    return render(request, 'evaluation/intermediate.html', {
        'subject': subject,
        'score': request.session.get('common_score_only'),
        'msg': request.session.get('logic_msg'),
        'next_level': queue[0] if queue else None
    })

@login_required
def preview_answers(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    user_answers = request.session.get('user_answers', {})
    questions = Question.objects.filter(id__in=user_answers.keys())
    for q in questions:
        q.user_choice = user_answers.get(str(q.id))
        q.is_correct = q.user_choice == q.correct_option
    return render(request, 'evaluation/preview.html', {'questions': questions, 'subject': subject})

# ==========================================
# 5. STAGE 2: LEVEL-SPECIFIC TESTING (Tiered)
# ==========================================

@login_required
def start_level_test(request, subject_id, level):
    subject = get_object_or_404(Subject, id=subject_id)
    all_qs = []
    # Force distribution: 4 questions from each of the 5 units
    for unit in range(1, 6):
        # Corrected order_by syntax
        qs = Question.objects.filter(subject=subject, difficulty=level, unit_number=unit, is_common=False).order_by('?')[:4]
        all_qs.extend(list(qs))
    
    # Pad to 20 questions if the admin hasn't added 4 questions per unit yet
    if len(all_qs) < 20:
        existing_ids = [q.id for q in all_qs]
        extras = Question.objects.filter(subject=subject, difficulty=level, is_common=False).exclude(id__in=existing_ids).order_by('?')[:(20-len(all_qs))]
        all_qs.extend(list(extras))
        
    return render(request, 'evaluation/quiz_level.html', {'questions': all_qs, 'subject': subject, 'level': level})

@login_required
def submit_level(request, subject_id):
    if request.method == "POST":
        current_level_score = 0
        for key, value in request.POST.items():
            if key.startswith('q_'):
                q_id = key.split('_')[1]
                if Question.objects.get(id=q_id).correct_option == value:
                    current_level_score += 1
        
        # Accumulate score across levels
        request.session['cumulative_score'] += current_level_score
        
        # Cycle through the Level Queue
        queue = request.session.get('level_queue', [])
        current_level = request.POST.get('level')
        
        try:
            current_index = queue.index(current_level)
            if current_index + 1 < len(queue):
                next_level = queue[current_index + 1]
                return redirect('start_level_test', subject_id=subject_id, level=next_level)
        except ValueError:
            pass

        # If no levels left in queue, save everything
        return finish_assessment(request, subject_id)

# ==========================================
# 6. FINAL ASSESSMENT & REGRESSION Math
# ==========================================

def finish_assessment(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    total_score = request.session.get('cumulative_score', 0)
    common_score = request.session.get('common_score_only', 0)
    
    # 📈 Regression Algorithm (Trend Calculation)
    past_attempts = Attempt.objects.filter(student=request.user, subject=subject).order_by('timestamp')
    trend, slope_val = "Stable", 0.0
    
    if np and past_attempts.count() >= 1:
        try:
            # Combine past scores with the current one for a trend analysis
            scores = [float(a.total_score) for a in past_attempts] + [float(total_score)]
            x = np.arange(len(scores))
            y = np.array(scores)
            slope, intercept = np.polyfit(x, y, 1)
            slope_val = round(slope, 2)
            # Interpret the slope
            if slope > 0.5: trend = "Improving"
            elif slope < -0.5: trend = "Declining"
            else: trend = "Stable"
        except Exception:
            pass 

    # Preparedness Score out of (20 Common + [Number of Levels] * 20)
    queue_len = len(request.session.get('level_queue', []))
    max_possible = 20 + (queue_len * 20)
    prep_percentage = round((total_score / max_possible) * 100, 2)

    # Permanent Save to Database
    Attempt.objects.create(
        student=request.user,
        subject=subject,
        common_score=common_score,
        level_score=total_score - common_score,
        total_score=total_score,
        unit_breakdown={}, # Could be populated with unit percentages
        preparedness_score=prep_percentage,
        improvement_rate=slope_val,
        trend=trend
    )
    
    # Critical Cleanup: Clear session variables so next test is fresh
    keys_to_clear = ['cumulative_score', 'common_score_only', 'level_queue', 'user_answers', 'logic_msg']
    for key in keys_to_clear:
        if key in request.session:
            del request.session[key]
            
    return redirect('dashboard')
