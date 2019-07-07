from django.db import models

class Comment(models.Model):
    user_name = models.CharField(max_length=200)
    parent_id = models.IntegerField()
    user_email = models.EmailField(max_length=200)
    home_page = models.URLField(max_length=200)
    text = models.TextField('Comment text')
    user_browser = models.TextField('Information about browser')
    user_ip = models.GenericIPAddressField(protocol='both', unpack_ipv4=False)
    def __str__(self):
        return self.text
	


