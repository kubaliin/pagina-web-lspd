
function json(response) {
  return response.json()
}

jQuery(document).ready(function() {

    $("#licencias").on('change', function() {
        var licenciaSeleccionada = $(this).children("option:selected").val();
        if (licenciaSeleccionada == 2) {
            $('#checkboxes').css({'display': 'block'});
        } else {
            $('#checkboxes').css({'display': 'none'});
            $('#psicotecnico').prop('checked', false);
            $('#confirmacion').prop('checked', false);
        }
    });
});