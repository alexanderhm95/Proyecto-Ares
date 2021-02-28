from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.http import HttpResponseRedirect
from django.urls import reverse
from .forms import FormularioLogin
def index(request):
    # Creamos el formulario de autenticación vacío
    
    if request.method=='POST':
        # Añadimos los datos recibidos al formulario
        formulario = FormularioLogin(data=request.POST)
        # Si el formulario es válido...
        if formulario.is_valid():
            # Recuperamos las credenciales validadas
            usuario = request.POST['username']
            clave = request.POST['password']
            # Verificamos las credenciales del usuario
            user = authenticate(username = usuario, password = clave)
            # Si existe un usuario con ese nombre y contraseña
            if user is not None:
                if user.is_active:
                    # Hacemos el login manualmente
                    login(request, user)
                    #obtener todos los grupos
                    
                    return HttpResponseRedirect(reverse('clientes'))
                else:
                    messages.warning(request,'Usuario inactivo')
            else:
                messages.warning(request,'Usuario y/o contraseña incorrecta')
    else:
        formulario = FormularioLogin()
    contex = {
        'formulario': formulario
    }
    return render(request, 'login/login.html', contex)


def desautenticar(request):
    logout(request)
    return HttpResponseRedirect(reverse('home_page'))

def welcome (request):
    return (request, 'login/welcome.html')

def forbidden (request):
    return (request, 'login/forbidden.html')
