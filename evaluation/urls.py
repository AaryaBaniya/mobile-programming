from django.urls import path
from . import views

urlpatterns = [
    # 1. Landing & Auth
    path('', views.landing_page, name='landing'),
    path('login/', views.UnifiedLoginView.as_view(), name='login'),
    path('signup/', views.signup_view, name='signup'),
    path('logout/', views.logout_view, name='logout'),

    # 2. Dashboard
    path('dashboard/', views.dashboard, name='dashboard'),

    # 3. Common Test (Stage 1)
    path('test/common/<int:subject_id>/', views.start_common_test, name='start_common_test'),
    path('test/submit-common/<int:subject_id>/', views.submit_common, name='submit_common'),
    
    # 4. Results & Review
    path('test/intermediate/<int:subject_id>/', views.intermediate_results, name='intermediate_results'),
    path('test/review/<int:subject_id>/', views.preview_answers, name='preview_answers'),

    # 5. Level Test (Stage 2)
    path('test/level/<int:subject_id>/<str:level>/', views.start_level_test, name='start_level_test'),
    path('test/submit-level/<int:subject_id>/', views.submit_level, name='submit_level'),
    path('test/results/<int:attempt_id>/', views.final_results_summary, name='final_results'),
]