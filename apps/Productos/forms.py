from django import forms
from apps.modelo.models import Producto,Detalle,Venta,Vehiculo


class FormularioProducto(forms.ModelForm):
    class Meta:
        model = Producto
        fields = ["precio", "nombre", "existencia"]
                  

class FormularioVenta(forms.ModelForm):
    class Meta:
        model = Venta
        fields = ["placas"]
        

class FormularioDetalle(forms.ModelForm):
    class Meta:
        model = Detalle
        fields = ["ngalones"]