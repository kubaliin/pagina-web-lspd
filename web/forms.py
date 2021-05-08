from django import forms


class CrearFichaForm(forms.Form):
    nombre = forms.CharField(label='Nombre', max_length=50)
    apellido = forms.CharField(label='Apellido', max_length=50)
    telefono = forms.IntegerField(label='Telefono', required=False)

    def clean(self):
        telefono = self.cleaned_data.get('telefono')

        if telefono is not None:
            if not len(str(telefono)) == 7:
                raise forms.ValidationError({'telefono': 'El teléfono debe tener 7 caracteres'})

        return self.cleaned_data
