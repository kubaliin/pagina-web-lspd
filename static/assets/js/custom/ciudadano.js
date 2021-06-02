

jQuery(document).ready(function() {
    var first_time_denuncias = true;
    var first_time_licencias = true;

    $("#cambiarImagen").on('click', function() {
        $("#staticBackdrop").modal('show');
    });

    $("#save").on('click', function() {
        $("#ciudadano").submit();
    });

    $("#denuncias-nav").on('click', function() {
        if (first_time_denuncias) {
            KTDatatableChildDenuncias.init();
            kt = $('#kt_datatable_2').KTDatatable();
            kt.reload();
            first_time_denuncias = false;
        }
    });

    $("#licencias-nav").on('click', function() {
        if (first_time_licencias) {
            KTDatatableChildLicencias.init();
            kt = $('#kt_datatable_3').KTDatatable();
            kt.reload();
            first_time_licencias = false;
        }
    });

    $("#busca-captura").on('click', function() {
        $("#buscacaptura").modal('show');
    });

    for (key in orden_alejamiento) {
        var id = orden_alejamiento[key]['id']
        var model = $("#orden-alejamiento-" + id)
        pintar_model(id, key, model);
    }
});

function pintar_model(id, key, model) {
    model.on('click', function() {
        if (orden_alejamiento[key]['resolucion'] == 'None') {
            $("#ordenalejamiento-body-" + id).html(orden_alejamiento[key]['motivo']);
        } else {
            $("#ordenalejamiento-body-" + id).html(orden_alejamiento[key]['motivo'] + '<br> Resolución: <br>' + orden_alejamiento[key]['resolucion']);
        }
        $("#ordenalejamiento-" + id).modal('show');
    });
}

function eliminar_busca_captura(id) {
    fetch('/ciudadano/cancelar-busca-captura/?id=' + id, {
        headers: {'csrftoken': '{{ csrf_token }}'},
        method: "GET",
    })
    .then(json)
    .then(function(response) {
        location.reload(true);
    });
}

function eliminar_orden_alejamiento(id){
    fetch('/ciudadano/cancelar-orden-alejamiento/?id=' + id, {
        headers: {'csrftoken': '{{ csrf_token }}'},
        method: "GET",
    })
    .then(json)
    .then(function(response) {
        location.reload(true);
    });
}

function guardar_imagen(id){
    var url = $("#urlImagen").val()
    console.log(url)
    fetch('/ciudadano/imagen-ciudadano/?url=' + url + '&id=' + id, {
        headers: {'csrftoken': '{{ csrf_token }}'},
        method: "GET",
    })
    .then(json)
    .then(function(response) {
        $("#staticBackdrop").modal('toggle');
        $("#kt_image_1").css({'background-image': 'url(' + url + ')'});
    });
}

function json(response) {
  return response.json()
}