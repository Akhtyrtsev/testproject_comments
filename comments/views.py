from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect, HttpResponse
from django.views import generic
from django.urls import reverse
from django.utils import timezone
from .forms import CommentForm
from .models import Comment
from django.views import View

from user_agents import parse

class AddComment(View):
    def post(self, request):
        if request.method == 'POST':
            form = CommentForm(request.POST)
            if form.is_valid():
                comment = form.save(commit=False)
                comment.parent_id = 1
                ua_string = request.META['HTTP_USER_AGENT']
                user_agent = parse(ua_string)
                comment.user_browser = user_agent.browser.family + ' ' + user_agent.browser.version_string
                comment.user_ip = request.META['REMOTE_ADDR']
                comment.published_date = timezone.now()
                comment.save()
            return HttpResponseRedirect('/comments/')
    def get(self, request):
        results = Comment.objects.all()[::-1]
        return render(request, "comments/index.html", {"results": results, "form":CommentForm})

    

