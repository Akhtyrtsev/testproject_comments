from django.core.validators import _lazy_re_compile, RegexValidator
from django.utils.translation import gettext_lazy as _

user_name_re = _lazy_re_compile(r'^[a-zA-Z0-9]')
validate_user_name = RegexValidator(
    user_name_re,
    _('Enter a valid “user_name” consisting of letters or numbers'),
    'invalid'
)
