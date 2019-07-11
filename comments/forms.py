from django import forms
from .models import Comment
from captcha.fields import CaptchaField
from django.utils.html import strip_tags
import re
class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['user_name', 'user_email', 'home_page', 'text']

    captcha = CaptchaField()
    parent_comment = forms.IntegerField(
        widget=forms.HiddenInput,
        required=False
    )
    def clean(self):
        cleaned_data = super().clean()
        user_name = cleaned_data.get("user_name") 
        text = cleaned_data.get("text")
        if re.search(r'<\/?[A-Za-z]+[^>]*>', text):
            raise forms.ValidationError('Text shouldn`t context HTML tag', code='invalid')
        if user_name.isalnum() == False:
            raise forms.ValidationError('Uncorrect user_name. Please use only alphabetic or numbers! ', code='invalid')

    
    

