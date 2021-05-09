'use strict';
// Class definition

var KTDatatableChildRemoteDataDemo = function() {
	// Private functions

	// demo initializer
	var demo = function() {

		var datatable = $('#kt_datatable').KTDatatable({
			// datasource definition
			data: {
				type: 'remote',
				source: {
					read: {
						url: 'http://127.0.0.1:8000' + '/buscar-ficha/ciudadanos/?nombre=',
						method: 'GET',
						headers: {'X-CSRFToken': '{{ csrf_token }}'},
					},
				},
				pageSize: 5, // display 20 records per page
				serverPaging: true,
				serverFiltering: false,
				serverSorting: true,
			},

			// layout definition
			layout: {
				scroll: true,
				footer: false,
			},

			// column sorting
			sortable: false,

			pagination: true,

			search: {
				input: $('#kt_datatable_search_query'),
				key: 'generalSearch'
			},

			// columns definition
			columns: [
				{
					field: 'nombre_completo',
					title: 'Nombre completo',
					autoHide: false,
					sortable: 'asc',
					template: function(row) {
						return '<a href="../ciudadano/?id=' + row['id'] + '">' + row['nombre_completo'] + '</a>';
					},
				},
				{
					field: 'telefono',
					title: 'Teléfono',
					autoHide: false,
					template: function(row) {
					    if (row['telefono'] == undefined) {
					        return 'Sin registro';
					    } else {
					        return row['telefono'];
					    }
					},
				},
				{
					field: 'Última detención',
					title: 'Última detención',
					autoHide: false,
					template: function(row) {
					    return 'En proceso'
					},
				},
				{
					field: 'Policia',
					title: 'Agente',
					autoHide: false,
					template: function(row) {
					    return 'En proceso'
					},
				},
				],
		});

		$('#kt_datatable_search_status').on('change', function() {
			datatable.search($(this).val().toLowerCase(), 'Status');
		});

		$('#kt_datatable_search_type').on('change', function() {
			datatable.search($(this).val().toLowerCase(), 'Type');
		});

		$('#kt_datatable_search_status, #kt_datatable_search_type').selectpicker();

	};

	return {
		// Public functions
		init: function() {
			// init dmeo
			demo();
		},
	};
}();

jQuery(document).ready(function() {
	KTDatatableChildRemoteDataDemo.init();
});
