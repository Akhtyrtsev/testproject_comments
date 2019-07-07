from django import forms
from .models import Comment


class CommentForm(forms.Form):

    user_name = forms.CharField(label = 'Name')
    user_email = forms.EmailField(label = 'Email')
    home_page = forms.URLField(label = 'Home page(unnecessary)')
    text = forms.CharField(
	label="Comment",
	widget=forms.Textarea
    )
    
    

