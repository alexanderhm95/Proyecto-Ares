# Generated by Django 3.1.7 on 2021-02-25 12:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Cliente',
            fields=[
                ('cli_id', models.AutoField(primary_key=True, serialize=False)),
                ('cedula', models.CharField(blank=True, max_length=10, unique=True)),
                ('nombres', models.CharField(blank=True, max_length=70)),
                ('apellidos', models.CharField(blank=True, max_length=70)),
                ('genero', models.CharField(blank=True, choices=[('femenino', 'Femenino'), ('masculino', 'Masculino')], default='femenino', max_length=20)),
                ('correo', models.CharField(blank=True, max_length=105)),
                ('celular', models.CharField(blank=True, max_length=15)),
                ('direccion', models.CharField(blank=True, max_length=200)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Detalle',
            fields=[
                ('detvent_id', models.AutoField(primary_key=True, serialize=False)),
                ('ngalones', models.CharField(max_length=20, unique=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Producto',
            fields=[
                ('prod_id', models.AutoField(primary_key=True, serialize=False)),
                ('precio', models.DecimalField(blank=True, decimal_places=3, max_digits=10)),
                ('nombre', models.CharField(blank=True, choices=[('Diesel', 'diesel'), ('Super', 'super'), ('Ecopais', 'ecopais')], max_length=20)),
                ('existencia', models.CharField(blank=True, max_length=20, unique=True)),
                ('estado', models.BooleanField(blank=True, default=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Vehiculo',
            fields=[
                ('vehiculo_id', models.AutoField(primary_key=True, serialize=False)),
                ('placas', models.CharField(blank=True, max_length=7)),
                ('cliente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='modelo.cliente')),
            ],
        ),
        migrations.CreateModel(
            name='Venta',
            fields=[
                ('vent_id', models.AutoField(primary_key=True, serialize=False)),
                ('total', models.DecimalField(decimal_places=3, max_digits=10)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('detalle', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='modelo.detalle')),
                ('vehiculo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='modelo.vehiculo')),
            ],
        ),
        migrations.AddField(
            model_name='detalle',
            name='producto',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='modelo.producto'),
        ),
    ]
