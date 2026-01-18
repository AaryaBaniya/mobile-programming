import json, numpy as np, time
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login as auth_login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import LoginView
from .models import Subject, Question, Attempt
from .forms import BCAStudentSignupForm

# --- AUTH & DASHBOARD (Unchanged) ---
def landing_page(request):
    if request.user.is_authenticated: return redirect('dashboard')
    return render(request, 'evaluation/landing.html')

class UnifiedLoginView(LoginView):
    template_name = 'registration/login.html'
    def form_valid(self, form):
        user = form.get_user()
        auth_login(self.request, user)
        return redirect('/admin/') if user.is_staff else redirect('dashboard')

def signup_view(request):
    if request.method == "POST":
        form = BCAStudentSignupForm(request.POST)
        if form.is_valid():
            user = form.save(); auth_login(request, user)
            return redirect('dashboard')
    else: form = BCAStudentSignupForm()
    return render(request, 'registration/signup.html', {'form': form})

def logout_view(request):
    logout(request); return redirect('landing')

@login_required
def dashboard(request):
    subjects = Subject.objects.all()
    subject_stats = []
    for sub in subjects:
        attempts = Attempt.objects.filter(student=request.user, subject=sub).order_by('timestamp')
        latest = attempts.last()
        scores = [float(a.total_score) for a in attempts]
        labels = [f"A{i+1}" for i in range(len(scores))]
        note_link = f"https://www.google.com/search?q=BCA+TU+6th+Semester+{sub.name}+Notes+PDF"
        subject_stats.append({
            'info': sub, 'latest': latest, 'count': attempts.count(),
            'chart_scores': json.dumps(scores), 'chart_labels': json.dumps(labels),
            'note_link': note_link
        })
    return render(request, 'evaluation/dashboard.html', {'subject_stats': subject_stats})

# --- TEST ENGINE LOGIC ---

@login_required
def start_common_test(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    # Clear session to prevent old data mixing
    for key in ['stage1_score', 'stage2_score', 'stage1_answers', 'stage2_answers', 'level_queue', 'logic_msg', 'max_possible']:
        if key in request.session: del request.session[key]
    
    questions = Question.objects.filter(subject=subject, is_common=True).order_by('?')[:20]
    request.session['start_time'] = time.time()
    return render(request, 'evaluation/quiz_common.html', {'questions': questions, 'subject': subject})

@login_required
def submit_common(request, subject_id):
    if request.method == "POST":
        ans = {k.split('_')[1]: v for k, v in request.POST.items() if k.startswith('q_')}
        questions = Question.objects.filter(id__in=ans.keys())
        score = sum(1 for q in questions if q.correct_option == ans.get(str(q.id)))
        
        if score < 11:
            queue, msg = ['easy', 'medium', 'hard'], f"Since your score is {score}/20, you must clear all tiers: Easy, Medium, and Hard."
        elif score <= 17:
            queue, msg = ['medium', 'hard'], f"Good effort! With {score}/20, you bypassed Easy. You must clear Medium and Hard."
        else:
            queue, msg = ['hard'], f"Excellent! With {score}/20, you are fast-tracked directly to the Hard Level."

        request.session['stage1_score'] = score
        request.session['stage1_answers'] = ans
        request.session['level_queue'] = queue
        request.session['logic_msg'] = msg
        return redirect('intermediate_results', subject_id=subject_id)
    return redirect('dashboard')

@login_required
def intermediate_results(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    return render(request, 'evaluation/intermediate.html', {
        'subject': subject, 
        'score': request.session.get('stage1_score', 0),
        'next_level': request.session.get('level_queue', ['hard'])[0],
        'logic_msg': request.session.get('logic_msg', "")
    })

@login_required
def start_level_test(request, subject_id, level):
    subject = get_object_or_404(Subject, id=subject_id)
    qs = Question.objects.filter(subject=subject, difficulty=level, is_common=False).order_by('?')[:20]
    return render(request, 'evaluation/quiz_level.html', {'questions': qs, 'subject': subject, 'level': level})

@login_required
def submit_level(request, subject_id):
    if request.method == "POST":
        ans = {k.split('_')[1]: v for k, v in request.POST.items() if k.startswith('q_')}
        questions = Question.objects.filter(id__in=ans.keys())
        current_lvl_score = sum(1 for q in questions if q.correct_option == ans.get(str(q.id)))

        s2_ans = request.session.get('stage2_answers', {})
        s2_ans.update(ans)
        request.session['stage2_answers'] = s2_ans
        request.session['stage2_score'] = request.session.get('stage2_score', 0) + current_lvl_score

        queue = request.session.get('level_queue', [])
        current_level_name = request.POST.get('level')
        try:
            idx = queue.index(current_level_name)
            if idx + 1 < len(queue):
                return redirect('start_level_test', subject_id=subject_id, level=queue[idx+1])
        except ValueError: pass
        return finish_assessment(request, subject_id)

def finish_assessment(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    s1 = request.session.get('stage1_score', 0)
    s2 = request.session.get('stage2_score', 0)
    total = s1 + s2
    
    queue = request.session.get('level_queue', [])
    max_possible = 20 + (len(queue) * 20)
    request.session['max_possible'] = max_possible 

    duration = int(time.time() - request.session.get('start_time', time.time()))
    prep = round((total / max_possible) * 100, 2)

    past = Attempt.objects.filter(student=request.user, subject=subject).order_by('timestamp')
    slope = 0.0
    if past.exists():
        scores = [float(a.total_score) for a in past] + [float(total)]
        slope = round(np.polyfit(np.arange(len(scores)), np.array(scores), 1)[0], 2)
    
    attempt = Attempt.objects.create(
        student=request.user, subject=subject, total_score=total,
        preparedness_score=prep, time_taken=duration, improvement_rate=slope,
        trend="Improving" if slope > 0.5 else "Declining" if slope < -0.5 else "Stable"
    )
    # Redirect to 'final_results' (ensure this matches your urls.py name)
    return redirect('final_results', attempt_id=attempt.id)

@login_required
def final_results_summary(request, attempt_id):
    attempt = get_object_or_404(Attempt, id=attempt_id, student=request.user)
    mins, secs = divmod(attempt.time_taken, 60)
    return render(request, 'evaluation/final_results.html', {
        'attempt': attempt, 
        'time_str': f"{mins}m {secs}s",
        'max_possible': request.session.get('max_possible', 60)
    })

@login_required
def preview_answers(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    mode = request.GET.get('mode', 'stage1') # Get mode from URL
    
    s1_ans = request.session.get('stage1_answers', {})
    s2_ans = request.session.get('stage2_answers', {})
    
    if mode == 'all':
        # Combine both dictionaries
        user_answers = {**s1_ans, **s2_ans}
    elif mode == 'stage2':
        user_answers = s2_ans
    else:
        user_answers = s1_ans

    # Fetch questions based on the selected answers
    questions = Question.objects.filter(id__in=[int(k) for k in user_answers.keys()]).order_by('-is_common')
    for q in questions:
        q.user_choice = user_answers.get(str(q.id))
        q.is_correct = q.user_choice == q.correct_option

    return render(request, 'evaluation/preview.html', {
        'questions': questions, 
        'subject': subject,
        'mode': mode
    })