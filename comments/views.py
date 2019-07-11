from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect, HttpResponse
from django.views import generic
from django.urls import reverse
from django.utils import timezone
from .forms import CommentForm
from .models import Comment
from django.views import View
from django.core.paginator import Paginator

from user_agents import parse


class AddComment(View):
    @staticmethod
    def byName(comment):
        return comment.user_name
    @staticmethod
    def byDate(comment):
        return comment.published_date
    def sortFunction(self, comments, value):
	"""
	Метод сортировки комментариев. Сначала отбираются и сортируются заглавные комментарии, а потом по их id к ним привязываются ответы.
	"""
        new_comment = [comment for comment in comments if len(comment.path)==4]
        children_comment = [comment for comment in comments if len(comment.path)!=4]
        if value == '1':
            sorted_new_comment = sorted(new_comment, key=self.byName)
        elif value == '2':
            sorted_new_comment = sorted(new_comment, key=self.byName, reverse=True)
        elif value == '3':
            sorted_new_comment = sorted(new_comment, key=self.byDate)
        elif value == '4':
            sorted_new_comment = sorted(new_comment, key=self.byDate, reverse = True)
        counter = 0
        result = []
        for comment in sorted_new_comment:
            result.append(comment)
            counter+=1
            for child in children_comment:
                if comment.path[1:] in child.path:
                    result.append(child)
                    counter +=1
        return result
    
    def post(self, request):
        if request.method == 'POST':
            form = CommentForm(request.POST) 
            if form.is_valid():
                comment = form.save(commit=False)
                comment.path = ''
                ua_string = request.META['HTTP_USER_AGENT']
                user_agent = parse(ua_string)
                comment.user_browser = user_agent.browser.family + ' ' + user_agent.browser.version_string
                comment.user_ip = request.META['REMOTE_ADDR']
                comment.published_date = timezone.now()
                comment.save()
                try:
                    comment.path += Comment.objects.get(id=form.cleaned_data['parent_comment']).path
                    comment.path += '%(number)03d' % {'number':comment.id}
                except:
                    comment.path += '1%(number)03d' % {'number':comment.id}
                comment.save()
            return self.get(request, form)

    def get(self, request, form=CommentForm()): 
        if not form.errors:
            form = CommentForm()
        result_list = Comment.objects.order_by('path')
        criterion = '4'
        if request.GET.get('sort'):
            criterion = request.GET.get('sort')
        result_list = self.sortFunction(result_list, criterion)
        paginator = Paginator(result_list, 4) 
        page = request.GET.get('page')
        results = paginator.get_page(page)
        return render(request, "comments/index.html", {"results": results, "form":form})

    

