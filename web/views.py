import datetime

from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.http import JsonResponse
from django.shortcuts import render, redirect
from rest_framework import generics

from web.forms import CrearFichaForm
from web.funcionescustom import ciudadanos_filtrado_nombre_completo
from web.models import Ciudadanos, Policia


@login_required
def Index(request):
    return redirect('../buscar-ficha/')


@login_required
def BuscarFicha(request):
    return render(request, 'lspd/buscar-ficha.html')


@login_required
def CrearFicha(request):
    form = CrearFichaForm(request.POST)

    if request.method == 'POST':
        filepath = request.FILES['myfile'] if 'myfile' in request.FILES else False
        newfilename = ''

        if filepath:
            myfile = request.FILES['myfile']
            fs = FileSystemStorage()
            newfilename = datetime.datetime.now().strftime("%Y%m%d%H%M%S") + '_' + myfile.name
            fs.save(newfilename, myfile)

        if form.is_valid():
            obj_p = Policia.objects.get(users_id=request.user.id)

            obj_c = Ciudadanos()
            obj_c.nombre = form.cleaned_data['nombre']
            obj_c.apellido = form.cleaned_data['apellido']
            obj_c.nombre_completo = form.cleaned_data['nombre'] + ' ' + form.cleaned_data['apellido']
            obj_c.telefono = form.cleaned_data['telefono']
            if filepath:
                obj_c.imagen = newfilename
            obj_c.creado_por = obj_p.id
            obj_c.save()

            successful_submit = True

            return render(request, 'lspd/crear-ficha.html', {'successful_submit': successful_submit})

        return render(request, 'lspd/crear-ficha.html', {'form': form.errors})

    return render(request, 'lspd/crear-ficha.html')


class CiudadanosDatos(generics.ListAPIView):
    def get(self, request, *args, **kwargs):
        datos = ciudadanos_filtrado_nombre_completo(request.GET['nombre'])

        return JsonResponse(datos, safe=False)
