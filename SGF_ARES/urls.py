from django.contrib import admin
from django.urls import path, include
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('clientes/', include('apps.Clientes.urls')),
    path('productos/', include('apps.Productos.urls')),
    path('login/', include('apps.login.urls')),
    path('', views.homePage, name='home_page'),
]
