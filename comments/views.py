from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect, HttpResponse
from django.views import generic
from django.urls import reverse
from django.utils import timezone
from .forms import CommentForm
from .models import Comment

def add_comment(request):
    if request.method == 'POST':
        comment = Comment()
        comment.user_name = request.POST.get('user_name')
        comment.user_email = request.POST.get('user_email')
        comment.home_page = request.POST.get('home_page')
        comment.text = request.POST.get('text')
        comment.parent_id = 1
        comment.browser = 'browser'
        comment.user_ip = '192.168.0.1'
        comment.save()
        return HttpResponseRedirect('http://127.0.0.1:8000/comments/')

def show_comment(request):
    results = Comment.objects.all()
    return render(request, "comments/index.html", {"results": results, "form":CommentForm})

