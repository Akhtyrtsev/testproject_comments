# Generated by Django 2.2.3 on 2019-07-08 10:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('comments', '0003_auto_20190708_1038'),
    ]

    operations = [
        migrations.AddField(
            model_name='comment',
            name='published_date',
            field=models.DateTimeField(blank=True, null=True),
        ),
    ]
