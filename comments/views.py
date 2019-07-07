from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect, HttpResponse
from django.views import generic
from django.urls import reverse
from django.utils import timezone
from .forms import CommentForm
from .models import Comment
from django.views import View

class AddComment(View):
    def post(self, request):
        if request.method == 'POST':
            self.comment = Comment()
            self.comment.user_name = request.POST.get('user_name')
            self.comment.user_email = request.POST.get('user_email')
            self.comment.home_page = request.POST.get('home_page')
            self.comment.text = request.POST.get('text')
            self.comment.parent_id = 1
            self.comment.browser = 'browser'
            self.comment.user_ip = '192.168.0.1'
            self.comment.save()
            return HttpResponseRedirect('http://127.0.0.1:8000/comments/')

class ShowComment(View):
    def get(self, request):
        results = Comment.objects.all()
        return render(request, "comments/index.html", {"results": results, "form":CommentForm})

