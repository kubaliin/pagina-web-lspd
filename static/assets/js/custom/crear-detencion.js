
function json(response) {
  return response.json()
}

jQuery(document).ready(function() {
    var count = 0;
    var listado_multas = [];

    $("#tipos_cargos").on('change', function() {
        fetch('/ciudadano/multas/?id_cargos=' + $( "#tipos_cargos" ).val() + '&filtrar_id=False', {
            headers: {'csrftoken': '{{ csrf_token }}'},
            method: "GET",
        })
        .then(json)
        .then(function(response) {
            $("#cargos").empty();

            var id = '';
            var descripcion = '';
            var articulo = '';
            var dinero = '';
            var tiempo = '';

            for (var key in response) {
                id = response[key]['id']
                descripcion = response[key]['descripcion']
                articulo = response[key]['articulo']
                dinero = response[key]['dinero']
                tiempo = response[key]['tiempo']

                var o = new Option("", id);
                $(o).html(descripcion + ' | ' + articulo + ' | ' + dinero + ' | ' + tiempo);
                $("#cargos").append(o);
            }
        });
    });

    $("#add").on('click', function() {
        $("#tabla_cargos").css("display", "table");

        fetch('/ciudadano/multas/?id_cargos=' + $( "#cargos" ).val() + '&filtrar_id=True', {
            headers: {'csrftoken': '{{ csrf_token }}'},
            method: "GET",
        })
        .then(json)
        .then(function(response) {
            var id_tr = "tr_" + count;
            var id_borrar = "borrar_" + count
            $('#tabla_cargos').append('<tr id="' + id_tr + '"><td>' + response[0]['id'] + '</td><td>' + response[0]['descripcion'] + '</td><td>' + response[0]['articulo'] + '</td><td>' + response[0]['tiempo'] + '</td><td>' + response[0]['dinero'] + '$</td><td><span class="flaticon-delete mr-3" id="' + id_borrar + '"></span></td></tr>');
            $("#" + id_borrar).on('click', function() {
                for (var key in listado_multas) {
                    for(var key2 in listado_multas[key]) {
                        if (listado_multas[key][key2]['id'] == $(this).closest('tr').find('td:first').text()) {
                            listado_multas.splice(key, 1);
                        }
                    }
                }
                $("#" + id_tr).remove();
            });

            listado_multas[count] = response

            count = count + 1;
        });
    });

    $("#crear").on('click', function() {
        var text = $('#cargos_escondidos')
        var listado_length = listado_multas.length
        var count = 1;
        //text.val('[');

        for (var key in listado_multas) {
            for (var key2 in listado_multas[key]) {
                if (count < listado_length) {
                    text.val(text.val() + listado_multas[key][key2]['id'] + ',');
                } else {
                    text.val(text.val() + listado_multas[key][key2]['id']);
                }
                count = count + 1;
            }
        }

        //text.val(text.val() + ']');
        $( "#crearDetencion" ).submit();
    });
});