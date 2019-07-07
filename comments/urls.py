from django.urls import path

from . import views

app_name = 'comments'

urlpatterns = [
    path('', views.ShowComment.as_view()),
    path('create/', views.AddComment.as_view()),
]
