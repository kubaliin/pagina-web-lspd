
function json(response) {
  return response.json()
}

jQuery(document).ready(function() {
    $("#policia").on('change', function() {
        var policia = $("#policia").val();
        for (key in datos) {
            if (datos[key]['id'] == policia) {
                var datos_policia = datos[key];
                $("#rangos").val(datos_policia.rango)
                if (datos_policia.last_login == 'None') {
                    $("#ultima_conexion").html('Sin última conexión.')
                } else {
                    $("#ultima_conexion").html(datos_policia.last_login)
                }
                if (datos_policia.is_active == 1) {
                    $('#activo').prop('checked', true)
                } else {
                    $('#activo').prop('checked', false)
                }
                if (datos_policia.is_staff == 1) {
                    $('#admin').prop('checked', true)
                } else {
                    $('#admin').prop('checked', false)
                }
            }
        }
    });
});

