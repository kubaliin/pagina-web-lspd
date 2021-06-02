from django.db import models


# Create your models here.

class Policia(models.Model):
    id = models.AutoField(primary_key=True)
    users_id = models.IntegerField()
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    telefono = models.IntegerField(null=True)
    placa = models.IntegerField(null=True)
    rango = models.IntegerField(null=True)

    class Meta:
        managed = False
        db_table = 'policia'


class Ciudadanos(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    nombre_completo = models.CharField(max_length=100)
    fecha_nacimiento = models.DateField(null=True)
    telefono = models.IntegerField(null=True)
    imagen = models.CharField(max_length=250, null=True)
    creado_por = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'ciudadanos'


class Detenciones(models.Model):
    id = models.AutoField(primary_key=True)
    id_ciudadanos = models.IntegerField()
    fecha = models.DateField()
    hora = models.TimeField()
    objetos = models.CharField(max_length=250)
    detalles = models.CharField(max_length=500, null=True)
    agente = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'detenciones'


class HistoricoMultas(models.Model):
    id = models.AutoField(primary_key=True)
    id_detenciones = models.IntegerField()
    id_multas = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'historico_multas'


class Denuncias(models.Model):
    id = models.AutoField(primary_key=True)
    ciudadano_id = models.IntegerField()
    denunciado = models.CharField(max_length=50)
    testigos = models.CharField(max_length=50, null=True)
    lugar = models.CharField(max_length=50, null=True)
    fecha = models.DateField()
    hora = models.TimeField()
    denuncia = models.CharField(max_length=500)
    pruebas = models.CharField(max_length=250, null=True)
    imagenes_id = models.IntegerField()
    estado = models.BooleanField()
    agente = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'denuncias'


class Imagenes(models.Model):
    id = models.AutoField(primary_key=True)
    url = models.CharField(max_length=500)
    imagenes_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'imagenes'


class Licencias(models.Model):
    id = models.AutoField(primary_key=True)
    ciudadano_id = models.IntegerField()
    tipos_licencias_id = models.IntegerField()
    fecha = models.DateField()
    hora = models.TimeField()
    psicotecnico = models.BooleanField(null=True)
    confirmacion = models.BooleanField(null=True)
    utilizacion = models.CharField(max_length=250)
    comentarios = models.CharField(max_length=500, null=True)
    estado = models.BooleanField()
    agente = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'licencias'


class OrdenAlejamiento(models.Model):
    id = models.AutoField(primary_key=True)
    ciudadano_id = models.IntegerField()
    denunciante = models.CharField(max_length=100)
    motivo = models.CharField(max_length=500)
    resolucion = models.CharField(max_length=500, null=True)
    estado = models.BooleanField()
    agente = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'orden_alejamiento'


class BuscaCaptura(models.Model):
    id = models.AutoField(primary_key=True)
    ciudadano_id = models.IntegerField()
    motivo = models.CharField(max_length=500)
    estado = models.BooleanField()
    agente = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'busca_captura'