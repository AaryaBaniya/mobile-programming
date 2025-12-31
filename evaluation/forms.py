from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm

class BCAStudentSignupForm(UserCreationForm):
    email = forms.EmailField(required=True, help_text="Required. Used for individual records.")
    first_name = forms.CharField(max_length=30, required=True, label="Full Name")

    class Meta:
        model = User
        fields = ("username", "first_name", "email") # These fields will appear in signup