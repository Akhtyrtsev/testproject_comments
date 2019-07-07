from django import forms
from .models import Comment
from .validators import validate_user_name

class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['user_name', 'user_email', 'home_page', 'text']

    """user_name = forms.CharField(label = 'Name', validators=[validate_user_name])
    user_email = forms.EmailField(label = 'Email')
    home_page = forms.URLField(label = 'Home page(unnecessary)', required = False)
    text = forms.CharField(
	label="Comment",
	widget=forms.Textarea
    )"""
    
    

