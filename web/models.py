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
    telefono = models.IntegerField(null=True)
    imagen = models.CharField(max_length=250, null=True)
    creado_por = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'ciudadanos'
