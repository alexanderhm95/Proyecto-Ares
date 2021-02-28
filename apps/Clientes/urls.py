from django.urls import path
from . import views

urlpatterns = [
    path('',views.index, name="clientes"),
    path('crearCliente', views.crearcliente, name="crearCliente"),
    path('vehiculos/<int:cedula>/', views.listarVehiculos, name="vehiculos"),
    path('crearVehiculo/<int:cedula>/', views.crearVehiculo, name="crearVehiculo"), 
    path('eliminarVehiculo/<int:vehiculo_id>/', views.eliminarVehiculo, name="eliminarVehiculo"), 
    path('eliminarCliente/<int:cedula>/', views.eliminarCliente, name="eliminarCliente"), 
    path('modificarCliente/<int:cedula>/', views.modificarCliente, name="modificarCliente"),
    path('modificarVehiculo/<int:vehiculo_id>/', views.modificarVehiculo, name="modificarVehiculo"),

]