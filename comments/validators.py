from django.core.exceptions import ValidationError

def validate_user_name(value):
    if value.isalnum() == False:
        raise ValidationError("Name should consist of latters and digits")
    else:
        return value

