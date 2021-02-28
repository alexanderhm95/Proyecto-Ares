from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='autenticar'),
    path('salir', views.desautenticar, name='salir'),
]