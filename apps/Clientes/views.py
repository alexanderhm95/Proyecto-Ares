from django.shortcuts import render, HttpResponse, redirect
from apps.modelo.models import Cliente,Vehiculo
from .forms import FormularioCliente, FormularioVehiculo



def index(request):
    listaclientes= Cliente.objects.all()
    return render(request, 'clientes/index.html', locals())
   


def crearcliente(request):
    formulario_cliente = FormularioCliente(request.POST)
    formulario_vehiculo = FormularioVehiculo(request.POST)
    if request.method == 'POST':
        if formulario_cliente.is_valid() and formulario_vehiculo.is_valid():
            cliente = Cliente()
            datos_cliente= formulario_cliente.cleaned_data
            cliente.cedula = datos_cliente.get('cedula')
            cliente.nombres = datos_cliente.get('nombres')
            cliente.apellidos = datos_cliente.get('apellidos')
            cliente.genero = datos_cliente.get('genero')
            cliente.correo = datos_cliente.get('correo')
            cliente.celular = datos_cliente.get('celular')
            cliente.direccion = datos_cliente.get('direccion')
            #ORM
            cliente.save()
            vehiculo=Vehiculo()
            datos_vehiculo   = formulario_vehiculo.cleaned_data
            vehiculo.placas  = datos_vehiculo.get('placas')
            vehiculo.cliente = cliente
            vehiculo.save()
            # ORM
            return redirect(index)
    return render(request, 'clientes/crearClientes.html', locals())

#==================Materias===================


def listarVehiculos(request, cedula):
    cliente = Cliente.objects.get(cedula = cedula)
    vehiculo = Vehiculo.objects.filter(cliente = cliente)
    return render(request, 'vehiculos/index.html', locals())


#MEtodo de filtrado por docentes
#def vMaterias(request,nombre):
#    listaMaterias= Materia.objects.filter(nombre=nombre)
#    return render(request, 'materias/nomina.html', locals())


def crearVehiculo(request, cedula):
    formulario_vehiculo = FormularioVehiculo(request.POST)
    cliente = Cliente.objects.get(cedula = cedula)
    if request.method == 'POST':
        if formulario_vehiculo.is_valid():
            
            vehiculo=Vehiculo()
            datos_vehiculo   = formulario_vehiculo.cleaned_data
            vehiculo.placas  = datos_vehiculo.get('placas')
            vehiculo.cliente = cliente
            vehiculo.save()
            return redirect(index)
    return render(request, 'vehiculos/crearVehiculos.html', locals())

def modificarCliente(request, cedula):
    cliente = Cliente.objects.get(cedula=cedula)
    if request.method == 'GET':
        formulario_cliente_editar = FormularioCliente(instance=cliente)
    else:
        formulario_cliente_editar = FormularioCliente(request.POST, instance=cliente)
        if formulario_cliente_editar.is_valid():
            formulario_cliente_editar.save()
        return redirect(index)
    return render(request, 'clientes/modificar.html', locals())

def modificarVehiculo(request, vehiculo_id):
    vehiculo = Vehiculo.objects.get(vehiculo_id = vehiculo_id)
    if request.method == 'GET':
        formulario_vehiculo_editar = FormularioVehiculo(instance=vehiculo)
    else:
        formulario_vehiculo_editar = FormularioVehiculo(request.POST, instance=vehiculo)
        if formulario_vehiculo_editar.is_valid():
            formulario_vehiculo_editar.save()
        return redirect(index)
    return render(request, 'vehiculos/modificar.html', locals())

def eliminarVehiculo(request, vehiculo_id):
    # Recuperamos la instancia de la persona y la borramos
    vehiculo = Vehiculo.objects.get(vehiculo_id = vehiculo_id)
    vehiculo.delete()
    return redirect(index)

def eliminarCliente(request, cedula):
    # Recuperamos la instancia de la persona y la borramos
    cliente = Cliente.objects.get(cedula = cedula)
    cliente.delete()
    return redirect(index)