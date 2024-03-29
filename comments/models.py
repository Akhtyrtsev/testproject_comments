from django.db import models
from django.utils import timezone
class Comment(models.Model):
    path = models.TextField(blank = True, null = True)
    user_name = models.CharField(max_length=200)
    user_email = models.EmailField(max_length=200)
    home_page = models.URLField(max_length=200, blank=True)
    text = models.TextField('Comment text')
    user_browser = models.TextField('Information about browser')
    user_ip = models.GenericIPAddressField(protocol='both', unpack_ipv4=False)
    published_date = models.DateTimeField(blank=True, null=True)
    def __str__(self):
        return self.text
    def get_offset(self):
	#Определяет уровень сдвига по длине пути
        level = int((len(self.path)-1)/3) - 1
        if level > 5:
            level = 5
        return level
 
    def get_col(self):
	#Определяет количество колонок в сетке
        level = int((len(self.path)-1)/3) - 1
        if level > 5:
            level = 5
        return 12 - level

# Древовидность структуры комментариев достигается за счет поля path, которое хранит полный путь иерархии комментариев. То есть, заглавные комментарии будут иметь значение path вида 1001, ответы на них 1001002 и тд. За основу берется id комментария.
