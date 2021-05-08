import datetime

from django.core.files.storage import FileSystemStorage
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
                obj_c.telefono = form.cleaned_data['telefono']
                if filepath:
                    obj_c.imagen = newfilename
                obj_c.creado_por = obj_p.id
                obj_c.save()

                successful_submit = True

                return render(request, 'lspd/crear-ficha.html', {'successful_submit': successful_submit})

            return render(request, 'lspd/crear-ficha.html', {'form': form.errors})

        return render(request, 'lspd/crear-ficha.html')
    else:
        return redirect('../accounts/login/')
