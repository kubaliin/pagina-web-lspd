from django import forms
from django.forms import ModelForm

from web.models import Denuncias


class CrearFichaForm(forms.Form):
    nombre = forms.CharField(label='Nombre', max_length=50)
    apellido = forms.CharField(label='Apellido', max_length=50)
    fecha_nacimiento = forms.DateField(label='Fecha_nacimiento', required=False)
    telefono = forms.IntegerField(label='Telefono', required=False)

    def clean(self):
        telefono = self.cleaned_data.get('telefono')

        if telefono is not None:
            if not len(str(telefono)) == 7:
                raise forms.ValidationError({'telefono': 'El teléfono debe tener 7 caracteres'})

        return self.cleaned_data


class AnadirDetencionForm(forms.Form):
    cargos_escondido = forms.CharField(widget=forms.Textarea)
    objetos = forms.CharField(widget=forms.Textarea)
    detalles = forms.CharField(widget=forms.Textarea, required=False)

    def clean(self):
        cargos_escondido = self.cleaned_data.get('cargos_escondido')
        objetos = self.cleaned_data.get('objetos')

        if cargos_escondido == '[]' and objetos is None:
            raise forms.ValidationError({'cargos_escondido': 'Tienes que añadir cargos',
                                         'objetos': 'Tienes que añadir las incautaciones de objetos, incluso si no has incautado nada'})
        elif objetos is None:
            raise forms.ValidationError(
                {'objetos': 'Tienes que añadir las incautaciones de objetos, incluso si no has incautado nada'})
        elif cargos_escondido == '[]':
            raise forms.ValidationError({'cargos_escondido': 'Tienes que añadir cargos'})

        return self.cleaned_data


class AnadirDenunciaForm(ModelForm):
    testigos = forms.CharField(label='Testigo', max_length=50, required=False)
    lugar = forms.CharField(label='Lugar', max_length=50, required=False)
    pruebas = forms.CharField(widget=forms.Textarea, required=False)
    imagenes_id = forms.CharField(widget=forms.Textarea, required=False)

    class Meta:
        model = Denuncias

        fields = ['denunciado', 'fecha', 'hora', 'denuncia']
        error_messages = {
            'denunciado': {
                "required": "Tienes que poner algún denunciado",
            },
            'fecha': {
                "required": "Tienes que seleccionar una fecha",
            },
            'hora': {
                "required": "Tienes que seleccionar una hora",
            },
            'denuncia': {
                "required": "Tienes que añadir una descripción/hechos de la denuncia",
            }
        }

