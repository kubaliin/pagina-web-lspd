"""lspd URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls.static import static
from django.contrib import admin
from django.contrib.auth.decorators import login_required
from django.urls import path, include

from lspd import settings
from web.views import Index, BuscarFicha, CrearFicha, CiudadanosDatos, ZonasPatrullaje, Ciudadano, CiudadanoDetenciones, \
    Normativa, CrearDetencion, CiudadanoMultas, Detencion, MultasCondenas

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('django.contrib.auth.urls')),
    path('', Index, name='index'),
    path('buscar-ficha/', BuscarFicha, name='buscar_ficha'),
    path('buscar-ficha/ciudadanos/', login_required(CiudadanosDatos.as_view()), name='ciudadanos_datos'),
    path('crear-ficha/', CrearFicha, name='crear_ficha'),
    path('zonas-patrullaje/', ZonasPatrullaje, name='zonas_patrullaje'),
    path('ciudadano/', Ciudadano, name='ciudadano'),
    path('ciudadano/detenciones/', login_required(CiudadanoDetenciones.as_view()), name='ciudadano_detenciones'),
    path('ciudadano/crear-detencion/', CrearDetencion, name='crear_detencion'),
    path('ciudadano/multas/', login_required(CiudadanoMultas.as_view()), name='ciudadano_multas'),
    path('ciudadano/detencion/', Detencion, name='detencion'),
    path('normativa/', Normativa, name='normativa'),
    path('multas-condenas/', MultasCondenas, name='multas_condenas'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
