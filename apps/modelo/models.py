from django.db import models


class Cliente(models.Model):
    listaGenero =(
        ('femenino','Femenino'),
        ('masculino','Masculino')
    )


    cli_id = models.AutoField(primary_key = True )
    cedula = models.CharField(max_length = 10, unique = True, null=False,blank=True)
    nombres = models.CharField(max_length = 70, null=False,blank=True)
    apellidos = models.CharField(max_length = 70,blank=True)
    genero = models.CharField(max_length=20,choices = listaGenero, default = "femenino",blank=True)
    correo= models.CharField(max_length = 105,blank=True)
    celular = models.CharField(max_length = 15,blank=True)
    direccion = models.CharField(max_length = 200,blank=True)
    date_created =models.DateTimeField(auto_now_add = True)

    def __str__(self):
        return self.cedula

class Vehiculo(models.Model):
    vehiculo_id = models.AutoField(primary_key = True)
    placas= models.CharField(max_length = 7, unique = True, null=False,blank=True)
    cliente= models.ForeignKey(Cliente, on_delete=models.CASCADE)

class Producto(models.Model):
    listacombustible =(
        
        ('Diesel','diesel'),
        ('Super','super'),
        ('Ecopais','ecopais')
    )
    prod_id = models.AutoField(primary_key = True)
    precio = models.DecimalField(max_digits=10, decimal_places=3, null = False,blank=True)
    nombre = models.CharField(max_length=20, unique = True,choices = listacombustible, null=False,blank=True)
    existencia = models.CharField(max_length=20,  null = False,blank=True)
    estado =  models.BooleanField(default=True,blank=True)
    date_created =models.DateTimeField(auto_now_add = True)
    def __str__(self):
        cadena = str(self.nombre)
        return cadena




class Detalle(models.Model):
    detvent_id = models.AutoField(primary_key = True,blank=True)
    ngalones = models.CharField(max_length=20,  null = False,blank=True)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE,blank=True)
    date_created =models.DateTimeField(auto_now_add = True,blank=True)
    def __str__(self):
        cadena = str(self.producto)
        return cadena

class Venta(models.Model):
    vent_id = models.AutoField(primary_key = True,blank=True)
    placas = models.CharField(max_length = 10, null=False,blank=True)
    vehiculo= models.ForeignKey(Vehiculo, on_delete=models.CASCADE,blank=True)
    detalle= models.ForeignKey(Detalle, on_delete=models.CASCADE,blank=True)
    total = models.DecimalField(max_digits=10, decimal_places=3, null = False,blank=True)
    date_created =models.DateTimeField(auto_now_add = True,blank=True)
    def __str__(self):
        cadena = str(self.vehiculo)
        return cadena