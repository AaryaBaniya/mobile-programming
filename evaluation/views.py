from django.shortcuts import render, redirect, get_object_or_404
from .models import Subject, Question, Attempt

def dashboard(request):
    subjects = Subject.objects.all()
    latest_attempt = Attempt.objects.filter(student=request.user).order_by('-timestamp').first()
    return render(request, 'evaluation/dashboard.html', {
        'subjects': subjects,
        'latest_attempt': latest_attempt
    })

def start_common_test(request, subject_id):
    subject = get_object_or_404(Subject, id=subject_id)
    # Fetch random common questions
    questions = Question.objects.filter(subject=subject, is_common=True).order_by('?')[:20]
    return render(request, 'evaluation/quiz_common.html', {
        'questions': questions,
        'subject': subject
    })

def submit_common(request, subject_id):
    if request.method == "POST":
        subject = get_object_or_404(Subject, id=subject_id)
        score = 0
        # Calculate the score
        for key, value in request.POST.items():
            if key.startswith('q_'):
                q_id = key.split('_')[1]
                question = Question.objects.get(id=q_id)
                if question.correct_option == value:
                    score += 1
        
        # Decide Level logic
        if score <= 8: level = 'easy'
        elif score <= 14: level = 'medium'
        else: level = 'hard'
        
        # We store the common score in the session temporarily
        request.session['common_score'] = score
        return redirect('start_level_test', subject_id=subject.id, level=level)

def start_level_test(request, subject_id, level):
    subject = get_object_or_404(Subject, id=subject_id)
    # Fetch questions for the determined level
    questions = Question.objects.filter(subject=subject, difficulty=level).order_by('?')[:20]
    return render(request, 'evaluation/quiz_level.html', {
        'questions': questions,
        'subject': subject,
        'level': level
    })
    import numpy as np # For regression

def submit_level(request, subject_id):
    if request.method == "POST":
        subject = get_object_or_404(Subject, id=subject_id)
        level_score = 0
        unit_results = {} # To track {unit_number: [correct, total]}

        # 1. Calculate Score & Unit Breakdown
        for key, value in request.POST.items():
            if key.startswith('q_'):
                q_id = key.split('_')[1]
                question = Question.objects.get(id=q_id)
                unit = str(question.unit_number)
                
                if unit not in unit_results:
                    unit_results[unit] = [0, 0] # [correct, total]
                
                unit_results[unit][1] += 1
                if question.correct_option == value:
                    level_score += 1
                    unit_results[unit][0] += 1

        # 2. Final Preparedness Stats
        common_score = request.session.get('common_score', 0)
        total_score = common_score + level_score # Out of 40
        prep_percentage = (total_score / 40) * 100

        # Calculate unit-wise percentage for weakness detection
        unit_breakdown = {u: (res[0]/res[1])*100 for u, res in unit_results.items()}

        # 3. Regression Analysis (Trend)
        past_attempts = Attempt.objects.filter(student=request.user, subject=subject).order_by('timestamp')
        improvement = 0.0
        trend = "Stable"

        if past_attempts.count() >= 1:
            scores = [a.total_score for a in past_attempts]
            scores.append(total_score)
            
            # Simple Linear Regression (Slope)
            x = np.arange(len(scores))
            y = np.array(scores)
            slope, intercept = np.polyfit(x, y, 1)
            
            improvement = round(slope * 10, 2)
            if slope > 0.5: trend = "Improving"
            elif slope < -0.5: trend = "Declining"

        # 4. Save the Attempt
        Attempt.objects.create(
            student=request.user,
            subject=subject,
            common_score=common_score,
            level_score=level_score,
            total_score=total_score,
            unit_breakdown=unit_breakdown,
            preparedness_score=round(prep_percentage, 2),
            improvement_rate=improvement,
            trend=trend
        )

        return redirect('dashboard')