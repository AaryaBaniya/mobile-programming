from django.urls import path
from . import views
urlpatterns = [
    path('', views.dashboard, name='dashboard'),
    path('test/common/<int:subject_id>/', views.start_common_test, name='start_common_test'),
    path('test/submit-common/<int:subject_id>/', views.submit_common, name='submit_common'),
    
    # NEW: Result & Review Paths
    path('test/intermediate/<int:subject_id>/', views.intermediate_results, name='intermediate_results'),
    path('test/review/<int:subject_id>/', views.preview_answers, name='preview_answers'),
    
    path('test/level/<int:subject_id>/<str:level>/', views.start_level_test, name='start_level_test'),
    path('test/submit-level/<int:subject_id>/', views.submit_level, name='submit_level'),
]



