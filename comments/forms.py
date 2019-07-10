from django import forms
from .models import Comment
from captcha.fields import CaptchaField
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
        if user_name.isalnum() == False:
            raise forms.ValidationError('Uncorrect data', code='invalid')

    
    

