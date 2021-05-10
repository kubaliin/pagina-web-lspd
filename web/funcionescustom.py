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
    ORDER BY
        ciudadanos.nombre_completo
    ASC
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
    ORDER BY
        detenciones.fecha DESC,
        detenciones.hora DESC
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


def tipos_multas():
    tiposMultasQuery = """
    SELECT
        tipos_multas.id,
        tipos_multas.descripcion
    FROM
        tipos_multas
    """

    cursor = connection.cursor()

    cursor.execute(tiposMultasQuery)
    datos = cursor.fetchall()
    datosClaves = [column[0] for column in cursor.description]
    datosLista = []

    for data in datos:
        datosLista.append(dict(zip(datosClaves, data)))

    cursor.close()

    return datosLista


def multas(filtros='', filtrarTipoMultas = False, filtrarIdMultas = False):
    multasQuery = """
    SELECT
        multas.id,
        multas.descripcion,
        multas.articulo,
        multas.tiempo,
        multas.dinero
    FROM
        multas
    """

    if filtrarTipoMultas:
        multasQuery = multasQuery + """WHERE multas.tipo_multas_id LIKE '%""" + filtros + """%'"""

    if filtrarIdMultas:
        multasQuery = multasQuery + """WHERE multas.id LIKE '""" + filtros + """'"""

    cursor = connection.cursor()

    cursor.execute(multasQuery)
    datos = cursor.fetchall()
    datosClaves = [column[0] for column in cursor.description]
    datosLista = []

    for data in datos:
        datosLista.append(dict(zip(datosClaves, data)))

    cursor.close()

    return datosLista


def id_detencion(fecha='', hora=''):
    idDetencionQuery = """
    SELECT
        detenciones.id
    FROM
        detenciones
    WHERE
        UPPER(detenciones.fecha) LIKE TRIM(UPPER('%""" + fecha + """%')) AND
        UPPER(detenciones.hora) LIKE TRIM(UPPER('%""" + hora + """%'))
    """

    cursor = connection.cursor()

    cursor.execute(idDetencionQuery)
    datos = cursor.fetchall()
    datosClaves = [column[0] for column in cursor.description]
    datosLista = []

    for data in datos:
        datosLista.append(dict(zip(datosClaves, data)))

    cursor.close()

    return datosLista
