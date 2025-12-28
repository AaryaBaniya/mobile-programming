from django.shortcuts import render, redirect, get_object_or_404
from .models import Subject, Question, Attempt
import numpy as np
import json

# ==========================================
# 1. MAIN DASHBOARD
# ==========================================
def dashboard(request):
    subjects = Subject.objects.all()
    latest_attempt = Attempt.objects.filter(student=request.user).order_by('-timestamp').first()
    return render(request, 'evaluation/dashboard.html', {
        'subjects': subjects,
        'latest_attempt': latest_attempt
    })

# ==========================================
# 2. STAGE 1: COMMON EVALUATION
# ==========================================
def start_common_test(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    questions = Question.objects.filter(subject=subject, is_common=True).order_by('?')[:20]
    return render(request, 'evaluation/quiz_common.html', {'questions': questions, 'subject': subject})

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
        
        # Assignment Logic
        if score < 11:
            level_queue = ['easy', 'medium', 'hard']
            msg = f"Score: {score}/20. You need to clear all levels starting from Easy."
        elif 11 <= score <= 17:
            level_queue = ['medium', 'hard']
            msg = f"Score: {score}/20. You have bypassed Easy and start from Medium."
        else:
            level_queue = ['hard']
            msg = f"Score: {score}/20. You are fast-tracked directly to the Hard Level."
            
        # Store State in Session
        request.session['cumulative_score'] = score
        request.session['common_score_only'] = score
        request.session['level_queue'] = level_queue
        request.session['logic_msg'] = msg
        request.session['user_answers'] = user_selections
        
        return redirect('intermediate_results', subject_id=subject.id)

# ==========================================
# 3. INTERMEDIATE & REVIEW PAGES
# ==========================================
def intermediate_results(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    return render(request, 'evaluation/intermediate.html', {
        'subject': subject,
        'score': request.session.get('common_score_only'),
        'msg': request.session.get('logic_msg'),
        'next_level': request.session.get('level_queue')[0]
    })

def preview_answers(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    user_answers = request.session.get('user_answers', {})
    questions = Question.objects.filter(id__in=user_answers.keys())
    for q in questions:
        q.user_choice = user_answers.get(str(q.id))
        q.is_correct = q.user_choice == q.correct_option
    return render(request, 'evaluation/preview.html', {'questions': questions, 'subject': subject})

# ==========================================
# 4. STAGE 2: TIERED LEVEL TESTS
# ==========================================
def start_level_test(request, subject_id, level):
    subject = get_object_or_404(Subject, id=subject_id)
    all_qs = []
    for unit in range(1, 6):
        qs = Question.objects.filter(subject=subject, difficulty=level, unit_number=unit, is_common=False).order_by('?')[:4]
        all_qs.extend(list(qs))
    
    # Fill remaining to ensure exactly 20 Qs
    if len(all_qs) < 20:
        existing_ids = [q.id for q in all_qs]
        remaining = 20 - len(all_qs)
        extras = Question.objects.filter(subject=subject, difficulty=level, is_common=False).exclude(id__in=existing_ids).order_by('?')[:remaining]
        all_qs.extend(list(extras))
        
    return render(request, 'evaluation/quiz_level.html', {'questions': all_qs, 'subject': subject, 'level': level})

def submit_level(request, subject_id):
    if request.method == "POST":
        current_level_score = 0
        # Tracks unit performance for the current test
        for key, value in request.POST.items():
            if key.startswith('q_'):
                q_id = key.split('_')[1]
                if Question.objects.get(id=q_id).correct_option == value:
                    current_level_score += 1
        
        # Add to cumulative score
        request.session['cumulative_score'] += current_level_score
        
        # Determine if we move to next level or finish
        queue = request.session.get('level_queue', [])
        current_level = request.POST.get('level')
        try:
            current_index = queue.index(current_level)
            if current_index + 1 < len(queue):
                next_level = queue[current_index + 1]
                return redirect('start_level_test', subject_id=subject_id, level=next_level)
        except ValueError: pass

        return finish_assessment(request, subject_id)

# ==========================================
# 5. FINAL: REGRESSION & DATABASE SAVE
# ==========================================
def finish_assessment(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    total_score = request.session.get('cumulative_score', 0)
    common_score = request.session.get('common_score_only', 0)
    
    # Calculate Max Possible Questions (Common 20 + 20 per Level taken)
    max_qs = 20 + (len(request.session.get('level_queue', [])) * 20)
    prep_percentage = round((total_score / max_qs) * 100, 2)

    # Simple Linear Regression for Trend
    past_attempts = Attempt.objects.filter(student=request.user, subject=subject).order_by('timestamp')
    trend, improvement = "Stable", 0.0
    if past_attempts.count() >= 1:
        scores = [float(a.total_score) for a in past_attempts] + [float(total_score)]
        x = np.arange(len(scores))
        y = np.array(scores)
        slope, intercept = np.polyfit(x, y, 1)
        improvement = round(slope, 2)
        trend = "Improving" if slope > 0.5 else "Declining" if slope < -0.5 else "Stable"

    # Save to Database
    Attempt.objects.create(
        student=request.user,
        subject=subject,
        common_score=common_score,
        level_score=total_score - common_score,
        total_score=total_score,
        unit_breakdown={}, # Advanced: Could store JSON unit stats here
        preparedness_score=prep_percentage,
        improvement_rate=improvement,
        trend=trend
    )
    
    # Final cleanup of session
    return redirect('dashboard')