import os

from django.db import connection

from lspd import settings


def convertir_query_diccionario(cursor, query):
    cursor.execute(query)
    datos = cursor.fetchall()
    datosClaves = [column[0] for column in cursor.description]
    datosLista = []

    for data in datos:
        datosLista.append(dict(zip(datosClaves, data)))

    return datosLista


def ciudadanos_filtrado_nombre_completo(filtros=""):
    ciudadanosQuery = """
    SELECT
        ciudadanos.id,
        ciudadanos.nombre_completo,
        ciudadanos.fecha_nacimiento,
        ciudadanos.telefono,
        ciudadanos.creado_por,
        policia.nombre,
        policia.apellido
    FROM
        ciudadanos
        INNER JOIN policia
         ON ciudadanos.creado_por = policia.id
    WHERE
        UPPER(ciudadanos.nombre_completo) LIKE TRIM(UPPER('%""" + filtros + """%'))
    ORDER BY
        ciudadanos.nombre_completo
    ASC
    """

    cursor = connection.cursor()

    datosLista = convertir_query_diccionario(cursor, ciudadanosQuery)

    cursor.close()

    return datosLista


def ciudadanos_filtrado_detenciones(filtros=""):
    ciudadanosQuery = """
    SELECT
        detenciones.id,
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

    datosLista = convertir_query_diccionario(cursor, ciudadanosQuery)

    cursor.close()

    return datosLista


def ciudadanos_filtrado_denuncias(filtros=""):
    ciudadanosQuery = """
    SELECT
        denuncias.id,
        denuncias.denunciado,
        denuncias.testigos,
        denuncias.lugar,
        denuncias.fecha,
        denuncias.hora,
        denuncias.denuncia,
        denuncias.pruebas,
        denuncias.imagenes_id,
        denuncias.estado,
        denuncias.agente
    FROM
        denuncias
    WHERE
        UPPER(denuncias.ciudadano_id) LIKE TRIM(UPPER('""" + filtros + """'))
    ORDER BY
        denuncias.fecha DESC,
        denuncias.hora DESC
    """

    cursor = connection.cursor()

    datosLista = convertir_query_diccionario(cursor, ciudadanosQuery)

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

    datosLista = convertir_query_diccionario(cursor, tiposMultasQuery)

    cursor.close()

    return datosLista


def multas(filtros='', filtrarTipoMultas=False, filtrarIdMultas=False):
    multasQuery = """
    SELECT
        multas.id,
        multas.tipo_multas_id,
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

    datosLista = convertir_query_diccionario(cursor, multasQuery)

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

    datosLista = convertir_query_diccionario(cursor, idDetencionQuery)

    cursor.close()

    return datosLista


def detencion(id_detencion=''):
    detencionQuery = """
    SELECT
        detenciones.id,
        detenciones.fecha,
        detenciones.hora,
        detenciones.objetos,
        detenciones.detalles,
        detenciones.agente,
        multas.descripcion,
        multas.articulo,
        multas.tiempo,
        multas.dinero
    FROM
        detenciones
        INNER JOIN historico_multas
         ON detenciones.id = historico_multas.id_detenciones
        INNER JOIN multas
         ON historico_multas.id_multas = multas.id
    WHERE
        UPPER(detenciones.id) LIKE '""" + id_detencion + """'
    """

    cursor = connection.cursor()

    datosLista = convertir_query_diccionario(cursor, detencionQuery)

    cursor.close()

    return datosLista


def policia(id=''):
    policiaQuery = """
    SELECT
        policia.nombre,
        policia.apellido,
        policia.placa
    FROM
        policia
    WHERE
        UPPER(policia.id) LIKE '""" + str(id) + """'
    """

    cursor = connection.cursor()

    datosLista = convertir_query_diccionario(cursor, policiaQuery)

    cursor.close()

    return datosLista


def imagenes_id(imagenes_id=''):
    policiaQuery = """
    SELECT
        imagenes.url
    FROM
        imagenes
    WHERE
        UPPER(imagenes.imagenes_id) LIKE '""" + str(imagenes_id) + """'
    """

    cursor = connection.cursor()

    datosLista = convertir_query_diccionario(cursor, policiaQuery)

    cursor.close()

    return datosLista


def denuncias(filtros=""):
    denunciasQuery = """
    SELECT
        denuncias.id,
        denuncias.denunciado,
        denuncias.testigos,
        denuncias.lugar,
        denuncias.fecha,
        denuncias.hora,
        denuncias.denuncia,
        denuncias.pruebas,
        denuncias.imagenes_id,
        denuncias.estado,
        denuncias.agente
    FROM
        denuncias
    WHERE
        UPPER(denuncias.id) LIKE TRIM(UPPER('""" + filtros + """'))
    ORDER BY
        denuncias.fecha DESC,
        denuncias.hora DESC
    """

    cursor = connection.cursor()

    datosLista = convertir_query_diccionario(cursor, denunciasQuery)

    cursor.close()

    return datosLista


def tipos_licencias():
    denunciasQuery = """
    SELECT
        tipos_licencias.id,
        tipos_licencias.descripcion
    FROM
        tipos_licencias
    """

    cursor = connection.cursor()

    datosLista = convertir_query_diccionario(cursor, denunciasQuery)

    cursor.close()

    return datosLista


def licencias(ciudadano_id="", licencias_id=""):
    licenciasQuery = """
    SELECT
        licencias.id,
        licencias.ciudadano_id,
        licencias.tipos_licencias_id ,
        licencias.fecha,
        licencias.hora,
        licencias.psicotecnico,
        licencias.confirmacion,
        licencias.utilizacion,
        licencias.comentarios,
        licencias.estado,
        licencias.agente,
        tipos_licencias.descripcion
    FROM
        licencias
        INNER JOIN tipos_licencias
         ON licencias.tipos_licencias_id = tipos_licencias.id
    """

    if not ciudadano_id == "":
        licenciasQuery = licenciasQuery + """
        WHERE
            UPPER(licencias.ciudadano_id) LIKE TRIM(UPPER('""" + ciudadano_id + """'))
        """
    else:
        licenciasQuery = licenciasQuery + """
        WHERE
            UPPER(licencias.id) LIKE TRIM(UPPER('""" + licencias_id + """'))
        """

    licenciasQuery = licenciasQuery + """   
    ORDER BY
        licencias.fecha DESC,
        licencias.hora DESC
    """

    cursor = connection.cursor()

    datosLista = convertir_query_diccionario(cursor, licenciasQuery)

    cursor.close()

    return datosLista


def orden_alejamiento(filtros=''):
    denunciasQuery = """
    SELECT
        orden_alejamiento.denunciante,
        orden_alejamiento.motivo,
        orden_alejamiento.resolucion,
        orden_alejamiento.agente
    FROM
        orden_alejamiento
        INNER JOIN ciudadanos
         ON orden_alejamiento.ciudadano_id = ciudadanos.id
    WHERE
        UPPER(ciudadanos.id) LIKE TRIM(UPPER('""" + filtros + """')) AND
        orden_alejamiento.estado LIKE '0'
    """

    cursor = connection.cursor()

    datosLista = convertir_query_diccionario(cursor, denunciasQuery)

    cursor.close()

    return datosLista


def busca_captura(filtros=''):
    denunciasQuery = """
    SELECT
        busca_captura.motivo,
        busca_captura.agente
    FROM
        busca_captura
        INNER JOIN ciudadanos
         ON busca_captura.ciudadano_id = ciudadanos.id
    WHERE
        UPPER(ciudadanos.id) LIKE TRIM(UPPER('""" + filtros + """')) AND
        busca_captura.estado LIKE '0'
    """

    cursor = connection.cursor()

    datosLista = convertir_query_diccionario(cursor, denunciasQuery)

    cursor.close()

    return datosLista
