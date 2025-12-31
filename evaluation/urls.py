from django.urls import path
from django.contrib.auth import views as auth_views # Built-in Login/Logout
from . import views

urlpatterns = [
    # Auth Paths
    path('signup/', views.signup_view, name='signup'),
    path('login/', auth_views.LoginView.as_view(template_name='registration/login.html'), name='login'),
    path('logout/', views.logout_view, name='logout'),

    # System Paths
    path('', views.dashboard, name='dashboard'),
    path('test/common/<int:subject_id>/', views.start_common_test, name='start_common_test'),
    path('test/submit-common/<int:subject_id>/', views.submit_common, name='submit_common'),
    path('test/intermediate/<int:subject_id>/', views.intermediate_results, name='intermediate_results'),
    path('test/review/<int:subject_id>/', views.preview_answers, name='preview_answers'),
    path('test/level/<int:subject_id>/<str:level>/', views.start_level_test, name='start_level_test'),
    path('test/submit-level/<int:subject_id>/', views.submit_level, name='submit_level'),
]