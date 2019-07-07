from django.urls import path

from . import views

app_name = 'comments'

urlpatterns = [
    path('', views.show_comment),
    path('create/', views.add_comment),
]
