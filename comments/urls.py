from django.urls import path
from django.views.decorators.csrf import csrf_protect
from . import views

app_name = 'comments'

urlpatterns = [
    path('', csrf_protect(views.AddComment.as_view())),
]
