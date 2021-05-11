

jQuery(document).ready(function() {
    var first_time = true;

    $("#save").on('click', function() {
        $("#ciudadano").submit();
    });

    $("#denuncias-nav").on('click', function() {
        if (first_time) {
            kt = $('#kt_datatable_2').KTDatatable();
            kt.reload()
            first_time = false;
        }
    });
});