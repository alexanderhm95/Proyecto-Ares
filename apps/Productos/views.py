from django.shortcuts import render, HttpResponse, redirect
from apps.modelo.models import Producto, Venta , Cliente, Detalle, Vehiculo
from .forms import FormularioProducto, FormularioDetalle, FormularioVenta
import os
from django.conf import settings
from django.http import HttpResponse
from django.template.loader import get_template
from xhtml2pdf import pisa
from django.contrib.staticfiles import finders


def index(request):
    listaproductos= Producto.objects.all()
    return render(request, 'productos/index.html', locals())
   


def crearProducto(request):
    formulario_producto = FormularioProducto(request.POST)
    if request.method == 'POST':
        if formulario_producto.is_valid():
            producto = Producto()            
            datos_producto = formulario_producto.cleaned_data
            producto.precio = datos_producto.get('precio')
            producto.nombre = datos_producto.get('nombre')
            producto.existencia = datos_producto.get('existencia')           
            if int(producto.existencia)>10:
                estado=True
            else:
                estado=False
            producto.estado = estado
            #ORM
            producto.save()
            # ORM
            return redirect(index)
    return render(request, 'productos/crearProducto.html', locals())

#==================Materias===================


def listarVentas(request):
    listarventas= Venta.objects.all()
    return render(request, 'ventas/index.html', locals())

#MEtodo de filtrado por docentes
#def vMaterias(request,nombre):
#    listaMaterias= Materia.objects.filter(nombre=nombre)
#    return render(request, 'materias/nomina.html', locals())


def crearVenta(request, id):
    formulario_detalle = FormularioDetalle(request.POST)
    formulario_venta = FormularioVenta(request.POST)
    producto = Producto.objects.get(prod_id  = id)
    if request.method == 'POST':
        if  formulario_detalle.is_valid() and formulario_venta.is_valid():
            print("**************************")
            print("entre")
            detalle = Detalle()
            datos_detalle  = formulario_detalle.cleaned_data
            datos_venta = formulario_venta.cleaned_data
            detalle.ngalones = datos_detalle.get('ngalones')
            
            detalle.producto = producto
            detalle.save()
            #Se crea la relacion entre docente y la materia que imparte 
            venta=Venta()
            
            if Vehiculo.objects.filter(placas = datos_venta.get('placas')).exists():
                venta.vehiculo = Vehiculo.objects.get(placas = datos_venta.get('placas'))
            else:
                print("No se encontro el vehiculo")
                return redirect(index)  
            venta.detalle= detalle
            venta.total  = float(producto.precio)*float(datos_detalle.get('ngalones'))
            venta.save()
            print("**************************")
            print("datos ",venta.vehiculo)
            return redirect(index)
    return render(request, 'ventas/crearVenta.html', locals())

def reporte(request, id):
    reporte = Venta.objects.get(vent_id= id)
    vehiculo = reporte.vehiculo
    detalle=reporte.detalle
    cliente= vehiculo.cliente
    producto=detalle.producto
    return render(request, 'ventas/reporte.html', locals())



def modificarProductos(request, prod_id):
    producto = Producto.objects.get(prod_id = prod_id)
    if request.method == 'GET':
        formulario_producto_editar = FormularioProducto(instance=producto)
    else:
        formulario_producto_editar = FormularioProducto(request.POST, instance=producto)
        if formulario_producto_editar.is_valid():
            formulario_producto_editar.save()
        return redirect(index)
    return render(request, 'productos/modificar.html', locals())

def eliminarVentas(request, vent_id):
    # Recuperamos la instancia de la persona y la borramos
    venta = Venta.objects.get(vent_id = vent_id)
    venta.delete()
    return redirect(index)

def eliminarProductos(request, prod_id):
    # Recuperamos la instancia de la persona y la borramos
    producto = Producto.objects.get(prod_id = prod_id)
    producto.delete()
    return redirect(index)