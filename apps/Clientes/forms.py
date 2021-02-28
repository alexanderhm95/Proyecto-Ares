from django import forms
from apps.modelo.models import Cliente, Vehiculo


class FormularioCliente(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = ["cedula", "nombres", "apellidos",
                  "genero", "correo", "celular","direccion"]
class FormularioVehiculo(forms.ModelForm):
    class Meta:
        model = Vehiculo
        fields = ["placas"]