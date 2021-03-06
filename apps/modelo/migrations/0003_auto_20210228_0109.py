# Generated by Django 3.1.7 on 2021-02-28 06:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('modelo', '0002_auto_20210227_1417'),
    ]

    operations = [
        migrations.AlterField(
            model_name='detalle',
            name='ngalones',
            field=models.CharField(blank=True, max_length=20, unique=True),
        ),
        migrations.AlterField(
            model_name='detalle',
            name='producto',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='modelo.producto'),
        ),
        migrations.AlterField(
            model_name='venta',
            name='detalle',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='modelo.detalle'),
        ),
        migrations.AlterField(
            model_name='venta',
            name='total',
            field=models.DecimalField(blank=True, decimal_places=3, max_digits=10),
        ),
        migrations.AlterField(
            model_name='venta',
            name='vehiculo',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='modelo.vehiculo'),
        ),
    ]
