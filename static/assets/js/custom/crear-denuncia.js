
function json(response) {
  return response.json()
}

jQuery(document).ready(function() {
    var count = 0;
    var listado_url = [];

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
        var id_tr = "tr_" + count;
        var id_borrar = "borrar_" + count
        var fileExtension = ['jpeg', 'jpg', 'png', 'gif', 'bmp'];
        var url = $('#url').val();
        var lastFive = url.substr(url.length - 5);
        var extension = lastFive.split(".").pop();

        $("#tabla_url").css("display", "table");

        if ($.inArray(extension, fileExtension) == -1) {
            $('#tabla_url').append('<tr id="' + id_tr + '"><td style="text-align: left;">' + url + '</td><td>' + '<span class="flaticon2-cross mr-3"></span>' + '</td><td><span class="flaticon-delete mr-3" id="' + id_borrar + '"></span></td></tr>');
        } else {
            $('#tabla_url').append('<tr id="' + id_tr + '"><td style="text-align: left;">' + url + '</td><td>' + '<span class="flaticon2-accept mr-3"></span>' + '</td><td><span class="flaticon-delete mr-3" id="' + id_borrar + '"></span></td></tr>');
            listado_url.push($('#url').val());
        }

        $("#" + id_borrar).on('click', function() {
            index = listado_url.indexOf($(this).closest('tr').find('td:first').text())
            console.log(index)
            if (!(index == -1)) {
                listado_url.splice(index, 1);
            }
            $("#" + id_tr).remove();
            console.log(listado_url)
        });

        count = count + 1;
    });

    $("#crear").on('click', function() {
        var text = $('#imagenes_id')
        var listado_length = listado_url.length
        var count = 1;

        text.val(listado_url);

        $( "#crearDenuncia" ).submit();
    });
});