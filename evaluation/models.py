from django.db import models
from django.contrib.auth.models import User

class Subject(models.Model):
    name = models.CharField(max_length=100)
    def __str__(self): return self.name

class Question(models.Model):
    DIFF_CHOICES = [('easy', 'Easy'), ('medium', 'Medium'), ('hard', 'Hard')]
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    unit_number = models.IntegerField()
    question_text = models.TextField()
    option_a = models.CharField(max_length=200)
    option_b = models.CharField(max_length=200)
    option_c = models.CharField(max_length=200)
    option_d = models.CharField(max_length=200)
    correct_option = models.CharField(max_length=1) # A, B, C, or D
    difficulty = models.CharField(max_length=10, choices=DIFF_CHOICES)
    is_common = models.BooleanField(default=False)

    def __str__(self):
        return f"U{self.unit_number} | {self.difficulty} | {self.question_text[:30]}"

class Attempt(models.Model):
    student = models.ForeignKey(User, on_delete=models.CASCADE)
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    common_score = models.IntegerField()
    level_score = models.IntegerField()
    total_score = models.IntegerField()
    unit_breakdown = models.JSONField() 
    preparedness_score = models.FloatField()
    improvement_rate = models.FloatField(default=0.0)
    trend = models.CharField(max_length=20, default="Stable")
    timestamp = models.DateTimeField(auto_now_add=True)