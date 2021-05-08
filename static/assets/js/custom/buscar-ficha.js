

jQuery(document).ready(function() {
    $("#busqueda").on('input', function() {
        var busqueda = $('#busqueda').val()
        var url = 'nombre=' + busqueda

        kt = $('#kt_datatable').KTDatatable();
        kt.options.data.source.read.data = url;
        kt.options.data.autoColumns;

        kt.reload()
    });
});



