# Generated by Django 3.1.7 on 2021-02-27 19:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('modelo', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='producto',
            name='nombre',
            field=models.CharField(blank=True, choices=[('Diesel', 'diesel'), ('Super', 'super'), ('Ecopais', 'ecopais')], max_length=20, unique=True),
        ),
        migrations.AlterField(
            model_name='vehiculo',
            name='placas',
            field=models.CharField(blank=True, max_length=7, unique=True),
        ),
    ]
