# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2017-11-27 15:28
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('snippets_example', '0004_snippet_file'),
    ]

    operations = [
        migrations.AlterField(
            model_name='snippet',
            name='file',
            field=models.FileField(upload_to=''),
        ),
    ]
