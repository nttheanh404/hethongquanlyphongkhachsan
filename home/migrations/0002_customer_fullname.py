# Generated by Django 5.1.3 on 2024-12-24 01:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='customer',
            name='fullname',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]