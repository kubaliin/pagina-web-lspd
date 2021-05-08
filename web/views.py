from django.shortcuts import render, redirect

from web.forms import CrearFichaForm
from web.models import Ciudadanos, Policia


def Index(request):
    if request.user.is_authenticated:
        return redirect('../buscar-ficha/')
    else:
        return redirect('../accounts/login/')


def BuscarFicha(request):
    if request.user.is_authenticated:
        return render(request, 'lspd/buscar-ficha.html')
    else:
        return redirect('../accounts/login/')


def CrearFicha(request):
    if request.user.is_authenticated:
        form = CrearFichaForm(request.POST)

        if request.method == 'POST':
            print('post valido')
            if form.is_valid():
                print('form valido')
                obj_p = Policia.objects.get(users_id=request.user.id)

                obj_c = Ciudadanos()
                obj_c.nombre = form.cleaned_data['nombre']
                obj_c.apellido = form.cleaned_data['apellido']
                obj_c.telefono = form.cleaned_data['telefono']
                obj_c.creado_por = obj_p.id
                obj_c.save()

                return render(request, 'lspd/buscar-ficha.html')

            return render(request, 'lspd/crear-ficha.html', {'form': form.errors})

        return render(request, 'lspd/crear-ficha.html')
    else:
        return redirect('../accounts/login/')
