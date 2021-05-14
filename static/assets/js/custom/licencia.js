
function json(response) {
  return response.json()
}

function cambiar_estado(id) {
    fetch('/ciudadano/cambiar-licencia/?id=' + id, {
        headers: {'csrftoken': '{{ csrf_token }}'},
        method: "GET",
    })
    .then(json)
    .then(function(response) {
        $("#modal-body").html('El estado de la licencia a cambiado a: ' + response);
        $("#modal").modal('show');
    });
}