import json
import numpy as np
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login as auth_login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import LoginView
from .models import Subject, Question, Attempt
from .forms import BCAStudentSignupForm

# ==========================================
# 1. ENTRY & AUTHENTICATION
# ==========================================

def landing_page(request):
    """Public landing page; redirects authenticated users based on role."""
    if request.user.is_authenticated:
        if request.user.is_staff:
            return redirect('/admin/')
        return redirect('dashboard')
    return render(request, 'evaluation/landing.html')

class UnifiedLoginView(LoginView):
    """Single login entry point for both Admin and Students."""
    template_name = 'registration/login.html'
    
    def form_valid(self, form):
        user = form.get_user()
        auth_login(self.request, user)
        if user.is_staff:
            return redirect('/admin/')
        return redirect('dashboard')

def signup_view(request):
    """Registration for new individual student records."""
    if request.method == "POST":
        form = BCAStudentSignupForm(request.POST)
        if form.is_valid():
            user = form.save()
            auth_login(request, user)
            return redirect('dashboard')
    else:
        form = BCAStudentSignupForm()
    return render(request, 'registration/signup.html', {'form': form})

@login_required
def logout_view(request):
    logout(request)
    return redirect('landing')

# ==========================================
# 2. MASTER DASHBOARD (Analytics)
# ==========================================

@login_required
def dashboard(request):
    subjects = Subject.objects.all()
    subject_stats = []

    for sub in subjects:
        attempts = Attempt.objects.filter(student=request.user, subject=sub).order_by('timestamp')
        latest = attempts.last()
        count = attempts.count()
        
        # Prepare graph data (Attempt numbers and Scores)
        history_scores = [float(a.total_score) for a in attempts]
        history_labels = [f"A{i+1}" for i in range(len(history_scores))]

        # Intelligence: Descriptive status based on preparedness percentage
        status = "Not Started"
        if latest:
            if latest.preparedness_score > 75: status = "Highly Prepared"
            elif latest.preparedness_score > 40: status = "Moderately Prepared"
            else: status = "Needs Focus"

        subject_stats.append({
            'info': sub,
            'latest': latest,
            'count': count,
            'status': status,
            'chart_scores': json.dumps(history_scores),
            'chart_labels': json.dumps(history_labels),
        })

    return render(request, 'evaluation/dashboard.html', {'subject_stats': subject_stats})

# ==========================================
# 3. STAGE 1 & INTERMEDIATE FEEDBACK
# ==========================================

@login_required
def start_common_test(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    questions = Question.objects.filter(subject=subject, is_common=True).order_by('?')[:20]
    # Reset session for a clean test run
    request.session['user_answers'] = {}
    return render(request, 'evaluation/quiz_common.html', {'questions': questions, 'subject': subject})

@login_required
def submit_common(request, subject_id):
    if request.method == "POST":
        subject = get_object_or_404(Subject, id=subject_id)
        score = 0
        answers = {} 

        for key, value in request.POST.items():
            if key.startswith('q_'):
                q_id = key.split('_')[1]
                answers[q_id] = value # Store first stage answers
                question = Question.objects.get(id=q_id)
                if question.correct_option == value:
                    score += 1
        
        # Determine the Level path for Stage 2
        if score < 11:
            level_queue = ['easy', 'medium', 'hard']
            msg = f"Since your score is {score}/20, you must clear all tiers: Easy, Medium, and Hard."
        elif 11 <= score <= 17:
            level_queue = ['medium', 'hard']
            msg = f"Good effort! With {score}/20, you bypassed Easy. You must clear Medium and Hard."
        else:
            level_queue = ['hard']
            msg = f"Excellent! With {score}/20, you are fast-tracked directly to the Hard Level."
            
        request.session['cumulative_score'] = score
        request.session['common_score_only'] = score
        request.session['user_answers'] = answers
        request.session['level_queue'] = level_queue
        request.session['logic_msg'] = msg
        
        return redirect('intermediate_results', subject_id=subject.id)

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

# ==========================================
# 4. STAGE 2: LEVEL-SPECIFIC TESTING
# ==========================================

@login_required
def start_level_test(request, subject_id, level):
    subject = get_object_or_404(Subject, id=subject_id)
    all_qs = []
    # Distribute: Try for 4 questions per unit (Units 1-5)
    for unit in range(1, 6):
        qs = Question.objects.filter(subject=subject, difficulty=level, unit_number=unit, is_common=False).order_by('?')[:4]
        all_qs.extend(list(qs))
    
    # Fill up to 20 if units are unevenly populated in Admin
    if len(all_qs) < 20:
        existing_ids = [q.id for q in all_qs]
        extras = Question.objects.filter(subject=subject, difficulty=level, is_common=False).exclude(id__in=existing_ids).order_by('?')[:(20-len(all_qs))]
        all_qs.extend(list(extras))
        
    return render(request, 'evaluation/quiz_level.html', {'questions': all_qs, 'subject': subject, 'level': level})

@login_required
def submit_level(request, subject_id):
    if request.method == "POST":
        current_score = 0
        full_answers = request.session.get('user_answers', {}) 

        for key, value in request.POST.items():
            if key.startswith('q_'):
                q_id = key.split('_')[1]
                full_answers[q_id] = value # APPEND Stage 2 choices to memory
                question = Question.objects.get(id=q_id)
                if question.correct_option == value:
                    current_score += 1
        
        request.session['cumulative_score'] += current_score
        request.session['user_answers'] = full_answers 
        
        # Determine if there's a next stage in the assigned queue
        queue = request.session.get('level_queue', [])
        current_level = request.POST.get('level')
        try:
            idx = queue.index(current_level)
            if idx + 1 < len(queue):
                return redirect('start_level_test', subject_id=subject_id, level=queue[idx+1])
        except: pass

        return finish_assessment(request, subject_id)

# ==========================================
# 5. COMPLETION, PREVIEW & REGRESSION
# ==========================================

def finish_assessment(request, subject_id):
    """The Helper that calculates final metrics and saves to MySQL."""
    subject = get_object_or_404(Subject, id=subject_id)
    total_score = request.session.get('cumulative_score', 0)
    common_score = request.session.get('common_score_only', 0)
    
    # 📈 REGRESSION CALCULATION
    past_attempts = Attempt.objects.filter(student=request.user, subject=subject).order_by('timestamp')
    trend, slope_val = "Stable", 0.0
    
    if np and past_attempts.count() >= 1:
        try:
            scores = [float(a.total_score) for a in past_attempts] + [float(total_score)]
            x = np.arange(len(scores))
            y = np.array(scores)
            slope = np.polyfit(x, y, 1)[0]
            slope_val = round(slope, 2)
            if slope > 0.5: trend = "Improving"
            elif slope < -0.5: trend = "Declining"
            else: trend = "Stable"
        except: pass 

    # Preparedness Score out of (Common 20 + 20 per Level taken)
    max_possible = 20 + (len(request.session.get('level_queue', [])) * 20)
    prep_score = round((total_score / max_possible) * 100, 2)

    # DYNAMIC UNIT BREAKDOWN Calculation
    full_answers = request.session.get('user_answers', {})
    unit_stats = {} 
    all_qs = Question.objects.filter(id__in=[int(k) for k in full_answers.keys()])
    for q in all_qs:
        u = str(q.unit_number)
        if u not in unit_stats: unit_stats[u] = [0, 0] # [Correct, Total]
        unit_stats[u][1] += 1
        if q.correct_option == full_answers.get(str(q.id)): 
            unit_stats[u][0] += 1
    
    unit_breakdown = {u: round((v[0]/v[1])*100, 1) for u, v in unit_stats.items()}

    # Create the DB record
    attempt = Attempt.objects.create(
        student=request.user,
        subject=subject,
        common_score=common_score,
        level_score=total_score - common_score,
        total_score=total_score,
        unit_breakdown=unit_breakdown,
        preparedness_score=prep_score,
        improvement_rate=slope_val,
        trend=trend
    )
    
    # CLEANUP session variables NOT needed for preview
    keys_to_clear = ['cumulative_score', 'common_score_only', 'level_queue', 'logic_msg']
    for k in keys_to_clear:
        if k in request.session: del request.session[k]
            
    return redirect('final_results', attempt_id=attempt.id)

@login_required
def final_results_summary(request, attempt_id):
    """Acts as a gate between test finishing and final review/dashboard."""
    attempt = get_object_or_404(Attempt, id=attempt_id, student=request.user)
    return render(request, 'evaluation/final_results.html', {'attempt': attempt})

@login_required
def preview_answers(request, subject_id):
    """Compiles all questions from the entire diagnostic journey."""
    subject = get_object_or_404(Subject, id=subject_id)
    user_answers = request.session.get('user_answers', {})
    
    if not user_answers:
        return redirect('dashboard')

    q_ids = [int(i) for i in user_answers.keys()]
    # We order so Stage 1 appears first
    questions = Question.objects.filter(id__in=q_ids).order_by('-is_common', 'unit_number')
    
    for q in questions:
        q.user_choice = user_answers.get(str(q.id))
        q.is_correct = q.user_choice == q.correct_option
        
    return render(request, 'evaluation/preview.html', {'questions': questions, 'subject': subject})