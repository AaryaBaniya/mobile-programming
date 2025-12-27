from django.contrib import admin
from .models import Subject, Question, Attempt

@admin.register(Subject)
class SubjectAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')

@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    list_display = ('question_text', 'subject', 'unit_number', 'difficulty', 'is_common')
    list_filter = ('subject', 'unit_number', 'difficulty', 'is_common')

@admin.register(Attempt)
class AttemptAdmin(admin.ModelAdmin):
    list_display = ('student', 'subject', 'total_score', 'timestamp')