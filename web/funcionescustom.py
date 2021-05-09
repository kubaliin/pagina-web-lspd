import os

from django.db import connection

from lspd import settings


def ciudadanos_filtrado_nombre_completo(filtros=""):
    ciudadanosQuery = """
    SELECT
        ciudadanos.id,
        ciudadanos.nombre_completo,
        ciudadanos.telefono
    FROM
        ciudadanos
    WHERE
        UPPER(ciudadanos.nombre_completo) LIKE TRIM(UPPER('%""" + filtros + """%'))
    """

    cursor = connection.cursor()

    cursor.execute(ciudadanosQuery)
    datos = cursor.fetchall()
    datosClaves = [column[0] for column in cursor.description]
    datosLista = []

    for data in datos:
        datosLista.append(dict(zip(datosClaves, data)))

    cursor.close()

    return datosLista


def ciudadanos_filtrado_detenciones(filtros=""):
    ciudadanosQuery = """
    SELECT
        detenciones.fecha,
        detenciones.hora,
        detenciones.agente,
        policia.nombre,
        policia.apellido,
        multas.descripcion
    FROM
        ciudadanos
        INNER JOIN detenciones
         ON ciudadanos.id = detenciones.id_ciudadanos
        INNER JOIN historico_multas
         ON detenciones.id = historico_multas.id_detenciones
        INNER JOIN multas
         ON historico_multas.id_multas = multas.id
        INNER JOIN policia
         ON detenciones.agente = policia.id
    WHERE
        UPPER(ciudadanos.id) LIKE TRIM(UPPER('%""" + filtros + """%'))
    """

    cursor = connection.cursor()

    cursor.execute(ciudadanosQuery)
    datos = cursor.fetchall()
    datosClaves = [column[0] for column in cursor.description]
    datosLista = []

    for data in datos:
        datosLista.append(dict(zip(datosClaves, data)))

    cursor.close()

    return datosLista


def _delete_file(path):
    if os.path.isfile(settings.MEDIA_ROOT + path):
        os.remove(os.path.join(settings.MEDIA_ROOT, path))
