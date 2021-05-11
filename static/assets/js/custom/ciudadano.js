

jQuery(document).ready(function() {
    var first_time = true;

    $("#save").on('click', function() {
        $("#ciudadano").submit();
    });

    $("#denuncias-nav").on('click', function() {
        if (first_time) {
            KTDatatableChildDenuncias.init();
            first_time = false;
        }
    });
});