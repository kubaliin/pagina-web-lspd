import datetime

from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.core.files.storage import FileSystemStorage
from django.http import JsonResponse
from django.shortcuts import render, redirect
from rest_framework import generics

from lspd.settings import URL_HOSTS
from web.forms import CrearFichaForm, AnadirDetencionForm, AnadirDenunciaForm, AnadirLicenciaForm, \
    AnadirOrdenAlejamientoForm, AnadirBuscaCapturaForm, MiCuentaForm
from web.funcionescustom import ciudadanos_filtrado_nombre_completo, ciudadanos_filtrado_detenciones, _delete_file, \
    tipos_multas, multas, id_detencion, detencion, ciudadanos_filtrado_denuncias, policia, imagenes_id, denuncias, \
    tipos_licencias, licencias, orden_alejamiento, busca_captura
from web.models import Ciudadanos, Policia, Detenciones, HistoricoMultas, Denuncias, Imagenes, Licencias, \
    OrdenAlejamiento, BuscaCaptura


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
            obj_c.fecha_nacimiento = form.cleaned_data['fecha_nacimiento']
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


@login_required
def ZonasPatrullaje(request):
    return render(request, 'lspd/zonas-patrullaje.html')


@login_required
def Ciudadano(request):
    id = request.GET['id']
    nombre_imagen = ''
    ciudadano = Ciudadanos.objects.get(id=id)
    nombre_completo = ciudadano.nombre_completo
    fecha_nacimiento = ciudadano.fecha_nacimiento
    telefono = ciudadano.telefono

    orden_alejamiento_activas = orden_alejamiento(id)
    busca_captura_activas = busca_captura(id)
    count = 0

    for key in orden_alejamiento_activas:
        p = policia(orden_alejamiento_activas[count]['agente'])
        orden_alejamiento_activas[count]['agente'] = p[0]['nombre'] + ' ' + p[0]['apellido']
        orden_alejamiento_activas[count]['placa'] = p[0]['placa']
        if orden_alejamiento_activas[count]['resolucion'] is None:
            orden_alejamiento_activas[count]['resolucion'] = 'None'
        count = count + 1

    count = 0

    for key in busca_captura_activas:
        p = policia(busca_captura_activas[count]['agente'])
        busca_captura_activas[count]['agente'] = p[0]['nombre'] + ' ' + p[0]['apellido']
        busca_captura_activas[count]['placa'] = p[0]['placa']
        count = count + 1

    if request.method == 'POST':
        filepath = request.FILES['profile_avatar'] if 'profile_avatar' in request.FILES else False
        if filepath:
            myfile = request.FILES['profile_avatar']
            fs = FileSystemStorage()
            newfilename = datetime.datetime.now().strftime("%Y%m%d%H%M%S") + '_' + myfile.name
            fs.save(newfilename, myfile)

            if ciudadano.imagen is not None:
                _delete_file(ciudadano.imagen)

            ciudadano.imagen = newfilename
            ciudadano.save()

    if ciudadano.imagen is None:
        imagen = False
    else:
        imagen = True
        nombre_imagen = ciudadano.imagen

    if fecha_nacimiento is None: fecha_nacimiento = 'Sin registro'
    if telefono is None: telefono = 'Sin registro'

    return render(request, 'lspd/ciudadano.html',
                  {'id': id, 'imagen': imagen, 'nombre_imagen': nombre_imagen, 'nombre_completo': nombre_completo,
                   'fecha_nacimiento': fecha_nacimiento, 'telefono': telefono,
                   'orden_alejamiento_activas': orden_alejamiento_activas,
                   'busca_captura_activas': busca_captura_activas})


class CiudadanoDetenciones(generics.ListAPIView):
    def get(self, request, *args, **kwargs):
        datos = ciudadanos_filtrado_detenciones(request.GET['id'])

        return JsonResponse(datos, safe=False)


class CiudadanoDenuncias(generics.ListAPIView):
    def get(self, request, *args, **kwargs):
        count = 0
        datos = ciudadanos_filtrado_denuncias(request.GET['id'])
        policia_info = policia(datos[count]['agente'])

        for key in datos:
            datos[count]['agente'] = policia_info[0]['nombre'] + ' ' + policia_info[0]['apellido']
            count = count + 1

        return JsonResponse(datos, safe=False)


class CiudadanoLicencias(generics.ListAPIView):
    def get(self, request, *args, **kwargs):
        count = 0
        datos = licencias(request.GET['id'])
        policia_info = policia(datos[count]['agente'])

        for key in datos:
            datos[count]['agente'] = policia_info[0]['nombre'] + ' ' + policia_info[0]['apellido']
            count = count + 1

        return JsonResponse(datos, safe=False)


@login_required
def CrearDetencion(request):
    tiposCargos = tipos_multas()
    cargos = multas()

    form = AnadirDetencionForm(request.POST)

    if request.method == 'POST':
        if form.is_valid():
            fecha_actual = datetime.datetime.now().strftime("%Y-%m-%d")
            hora_actual = datetime.datetime.now().strftime("%H:%M:%S")

            obj_p = Policia.objects.get(users_id=request.user.id)

            obj_d = Detenciones()
            obj_d.id_ciudadanos = request.GET['id']
            obj_d.fecha = fecha_actual
            obj_d.hora = hora_actual
            obj_d.objetos = form.cleaned_data['objetos']
            if not form.cleaned_data['detalles'] == '':
                obj_d.detalles = form.cleaned_data['detalles']
            obj_d.agente = obj_p.id

            obj_d.save()

            id = id_detencion(fecha_actual, hora_actual)

            multas_puestas = list(form.cleaned_data['cargos_escondido'].split(","))

            for i in multas_puestas:
                obj_h = HistoricoMultas()
                obj_h.id_detenciones = id[0]['id']
                obj_h.id_multas = i
                obj_h.save()

            return redirect(URL_HOSTS + '/ciudadano/?id=' + request.GET['id'])

        return render(request, 'lspd/crear-detencion.html',
                      {'form': form.errors, 'tipos_cargos': tiposCargos, 'cargos': cargos})

    return render(request, 'lspd/crear-detencion.html', {'tipos_cargos': tiposCargos, 'cargos': cargos})


class CiudadanoMultas(generics.ListAPIView):
    def get(self, request, *args, **kwargs):
        filtrar_id = request.GET['filtrar_id']

        if filtrar_id == 'True':
            datos = multas(request.GET['id_cargos'], False, True)
        else:
            datos = multas(request.GET['id_cargos'], True)

        return JsonResponse(datos, safe=False)


@login_required
def Detencion(request):
    datos = detencion(request.GET['id'])
    obj_p = Policia.objects.get(id=datos[0]['agente'])
    total_multas = 0
    count = 0

    policia = '| ' + obj_p.nombre + ' ' + obj_p.apellido + ' | ' + str(obj_p.placa) + ' |'

    for key in datos:
        total_multas = total_multas + datos[count]['dinero']
        count = count + 1

    return render(request, 'lspd/detencion.html',
                  {'fecha': datos[0]['fecha'], 'hora': datos[0]['hora'], 'objetos': datos[0]['objetos'],
                   'detalles': datos[0]['detalles'], 'datos': datos, 'total_multas': total_multas, 'policia': policia})


@login_required
def CrearDenuncia(request):
    form = AnadirDenunciaForm(request.POST)

    if request.method == 'POST':
        if form.is_valid():
            obj_p = Policia.objects.get(users_id=request.user.id)

            obj_d = Denuncias()
            obj_d.ciudadano_id = request.GET['id']
            obj_d.denunciado = form.cleaned_data['denunciado']
            if not form.cleaned_data['testigos'] == '':
                obj_d.testigos = form.cleaned_data['testigos']
            if not form.cleaned_data['lugar'] == '':
                obj_d.testigos = form.cleaned_data['lugar']
            obj_d.fecha = form.cleaned_data['fecha']
            obj_d.hora = form.cleaned_data['hora']
            obj_d.denuncia = form.cleaned_data['denuncia']
            if not form.cleaned_data['pruebas'] == '':
                obj_d.pruebas = form.cleaned_data['pruebas']
            if not form.cleaned_data['imagenes_id'] == '':
                new_file_name = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
                obj_d.imagenes_id = new_file_name
                obj_d.estado = 0
                obj_d.agente = obj_p.id

                obj_d.save()

                obj_i = Imagenes()
                obj_i.url = form.cleaned_data['imagenes_id']
                obj_i.imagenes_id = new_file_name

                obj_i.save()

                return redirect(URL_HOSTS + '/ciudadano/?id=' + request.GET['id'])
            else:
                obj_d.estado = 0
                obj_d.agente = obj_p.id

                obj_d.save()

                return redirect(URL_HOSTS + '/ciudadano/?id=' + request.GET['id'])

        return render(request, 'lspd/crear-denuncia.html', {'form': form.errors})

    return render(request, 'lspd/crear-denuncia.html', {})


@login_required
def Denuncia(request):
    datos_denuncias = denuncias(request.GET['id'])
    datos_policia = policia(datos_denuncias[0]['agente'])
    datos_imagenes = imagenes_id(datos_denuncias[0]['imagenes_id'])

    return render(request, 'lspd/denuncia.html', {'datos_denuncias': datos_denuncias, 'datos_policia': datos_policia,
                                                  'datos_imagenes': datos_imagenes})


@login_required
def CrearLicencia(request):
    form = AnadirLicenciaForm(request.POST)
    licencias = tipos_licencias()

    if request.method == 'POST':
        if form.is_valid():
            obj_p = Policia.objects.get(users_id=request.user.id)
            obj_l = Licencias()

            obj_l.ciudadano_id = request.GET['id']
            obj_l.tipos_licencias_id = form.cleaned_data['licencias']
            obj_l.fecha = form.cleaned_data['fecha']
            obj_l.hora = form.cleaned_data['hora']
            if form.cleaned_data['psicotecnico']:
                obj_l.psicotecnico = 0
            else:
                obj_l.psicotecnico = 1

            if form.cleaned_data['confirmacion']:
                obj_l.confirmacion = 0
            else:
                obj_l.confirmacion = 1

            print(form.cleaned_data)
            print(form.cleaned_data['psicotecnico'])
            print(form.cleaned_data['confirmacion'])

            obj_l.utilizacion = form.cleaned_data['utilizacion']
            obj_l.comentarios = form.cleaned_data['comentarios']
            obj_l.estado = 0
            obj_l.agente = obj_p.id

            obj_l.save()

            return redirect(URL_HOSTS + '/ciudadano/?id=' + request.GET['id'])

        return render(request, 'lspd/crear-licencia.html', {'form': form.errors, 'licencias': licencias})

    return render(request, 'lspd/crear-licencia.html', {'licencias': licencias})


@login_required
def Licencia(request):
    datos_licencias = licencias("", request.GET['id'])
    datos_policia = policia(datos_licencias[0]['agente'])

    return render(request, 'lspd/licencia.html', {'datos_licencias': datos_licencias, 'datos_policia': datos_policia})


@login_required
def CrearOrdenAlejamiento(request):
    form = AnadirOrdenAlejamientoForm(request.POST)

    if request.method == 'POST':
        if form.is_valid():
            obj_p = Policia.objects.get(users_id=request.user.id)
            obj_o = OrdenAlejamiento()

            obj_o.ciudadano_id = request.GET['id']
            obj_o.denunciante = form.cleaned_data['denunciante']
            obj_o.motivo = form.cleaned_data['motivo']
            if not form.cleaned_data['resolucion'] == '':
                obj_o.resolucion = form.cleaned_data['resolucion']
            obj_o.estado = 0
            obj_o.agente = obj_p.id

            obj_o.save()

            return redirect(URL_HOSTS + '/ciudadano/?id=' + request.GET['id'])

        return render(request, 'lspd/crear-orden-alejamiento.html', {'form': form.errors})

    return render(request, 'lspd/crear-orden-alejamiento.html', {'licencias': licencias})


@login_required
def CrearBuscaCaptura(request):
    form = AnadirBuscaCapturaForm(request.POST)

    if request.method == 'POST':
        if form.is_valid():
            obj_p = Policia.objects.get(users_id=request.user.id)
            obj_b = BuscaCaptura()

            obj_b.ciudadano_id = request.GET['id']
            obj_b.motivo = form.cleaned_data['motivo']
            obj_b.estado = 0
            obj_b.agente = obj_p.id

            obj_b.save()

            return redirect(URL_HOSTS + '/ciudadano/?id=' + request.GET['id'])

        return render(request, 'lspd/crear-busca-captura.html', {'form': form.errors, 'licencias': licencias})

    return render(request, 'lspd/crear-busca-captura.html', {'licencias': licencias})


@login_required
def Normativa(request):
    return render(request, 'lspd/normativa.html')


@login_required
def MultasCondenas(request):
    tiposCargos = tipos_multas()
    cargos = multas()

    return render(request, 'lspd/multas-condenas.html', {'tiposCargos': tiposCargos, 'cargos': cargos})


class CiudadanoCancelarBuscaCaptura(generics.ListAPIView):
    def get(self, request, *args, **kwargs):
        id = request.GET['id']

        if BuscaCaptura.objects.get(id=id).delete():
            datos = 'Eliminado correctamente'
        else:
            datos = 'No se puede eliminar'

        return JsonResponse(datos, safe=False)


class CiudadanoCancelarOrdenAlejamiento(generics.ListAPIView):
    def get(self, request, *args, **kwargs):
        id = request.GET['id']

        if OrdenAlejamiento.objects.get(id=id).delete():
            datos = 'Eliminado correctamente'
        else:
            datos = 'No se puede eliminar'

        return JsonResponse(datos, safe=False)


class CiudadanoCambiarLicencia(generics.ListAPIView):
    def get(self, request, *args, **kwargs):
        id = request.GET['id']

        o = Licencias.objects.get(id=id)
        estado_actual = o.estado

        if estado_actual:
            o.estado = False
            o.save()
            datos = 'Válida'
        else:
            o.estado = True
            o.save()
            datos = 'Revocada'

        return JsonResponse(datos, safe=False)


class CiudadanoCambiarDenuncia(generics.ListAPIView):
    def get(self, request, *args, **kwargs):
        id = request.GET['id']

        d = Denuncias.objects.get(id=id)
        estado_actual = d.estado

        if estado_actual:
            d.estado = False
            d.save()
            datos = 'Abierta'
        else:
            d.estado = True
            d.save()
            datos = 'Cerrada'

        return JsonResponse(datos, safe=False)


@login_required
def MiCuenta(request):
    form = MiCuentaForm(request.POST)

    owner = request.user
    p = Policia.objects.get(users_id=request.user.id)
    nombre = p.nombre
    apellido = p.apellido
    telefono = p.telefono
    placa = p.placa

    if request.method == 'POST':
        if form.is_valid():
            if not form.cleaned_data['username'] == owner.username:
                owner.username = form.cleaned_data['username']
                owner.save()
            if not form.cleaned_data['password'] == '':
                if form.cleaned_data['password'] == form.cleaned_data['password2']:
                    u = User.objects.get(id=request.user.id)
                    u.set_password(form.cleaned_data['password'])
                    u.save()
            if not form.cleaned_data['nombre'] == nombre:
                p.nombre = form.cleaned_data['nombre']
            if not form.cleaned_data['apellido'] == apellido:
                p.apellido = form.cleaned_data['apellido']
            if not form.cleaned_data['telefono'] == telefono:
                p.telefono = form.cleaned_data['telefono']
            if not form.cleaned_data['placa'] == placa:
                p.placa = form.cleaned_data['placa']
            p.save()

        return render(request, 'lspd/buscar-ficha.html', {})

    return render(request, 'lspd/mi-cuenta.html',
                  {'username': owner.username, 'nombre': nombre, 'apellido': apellido, 'telefono': telefono,
                   'placa': placa})


class CiudadanoEliminarDenuncion(generics.ListAPIView):
    def get(self, request, *args, **kwargs):
        id = request.GET['id']

        d = Detenciones.objects.get(id=id)
        h = HistoricoMultas.objects.filter(id_detenciones=d.id)

        id_ciudadano = d.id_ciudadanos

        h.delete()
        d.delete()

        return redirect(URL_HOSTS + '/ciudadano/?id=' + str(id_ciudadano))


class CiudadanoEliminarLicencia(generics.ListAPIView):
    def get(self, request, *args, **kwargs):
        id = request.GET['id']

        l = Licencias.objects.get(id=id)

        id_ciudadano = l.ciudadano_id

        l.delete()

        return redirect(URL_HOSTS + '/ciudadano/?id=' + str(id_ciudadano))


class CiudadanoEliminarDenuncia(generics.ListAPIView):
    def get(self, request, *args, **kwargs):
        id = request.GET['id']

        d = Denuncias.objects.get(id=id)
        i = Imagenes.objects.filter(imagenes_id=d.imagenes_id)

        id_ciudadano = d.ciudadano_id

        i.delete()
        d.delete()

        return redirect(URL_HOSTS + '/ciudadano/?id=' + str(id_ciudadano))







