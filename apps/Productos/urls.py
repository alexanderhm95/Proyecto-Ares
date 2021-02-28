from django.urls import path
from . import views

urlpatterns = [
    
    path('',views.index, name="productos"),
    path('crearProducto', views.crearProducto, name="crearProducto"),
    path('crearVenta/<int:id>/', views.crearVenta, name="crearVenta"),
    path('reporte/<int:id>/', views.reporte, name="reporte"),
    path('listarVentas', views.listarVentas, name="listarVentas"),
    path('eliminarVentas/<int:vent_id>/', views.eliminarVentas, name="eliminarVentas"), 
    path('eliminarProductos/<int:prod_id>/', views.eliminarProductos, name="eliminarProductos"), 
    path('modificarProductos/<int:prod_id>/', views.modificarProductos, name="modificarProductos"),
    

]