

jQuery(document).ready(function() {
    var first_time_denuncias = true;
    var first_time_licencias = true;

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
});