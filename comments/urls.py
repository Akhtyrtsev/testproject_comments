from django.urls import path

from . import views

app_name = 'comments'

urlpatterns = [
    path('', views.AddComment.as_view()),
]
