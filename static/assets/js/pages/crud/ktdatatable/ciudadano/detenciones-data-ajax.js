'use strict';
// Class definition

var KTDatatableChildRemoteDataDemo = function() {

	// demo initializer
	var demo = function() {

		var datatable = $('#kt_datatable_1').KTDatatable({
			// datasource definition
			data: {
				type: 'remote',
				source: {
					read: {
						url: 'http://127.0.0.1:8000' + '/ciudadano/detenciones/?id=' + id,
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
					field: 'cargo',
					title: 'Cargo',
					autoHide: false,
					template: function(row) {
						return '<a href="../ciudadano/detencion/?id=' + row['id'] + '">' + row['descripcion'] + '</a>';
					},
				},
				{
					field: 'fecha',
					title: 'Fecha',
					sortable: 'asc',
					autoHide: false,
					template: function(row) {
					    if (row['fecha'] == undefined) {
					        return 'Sin registro';
					    } else {
					        return row['fecha'];
					    }
					},
				},
				{
					field: 'hora',
					title: 'Hora',
					autoHide: false,
					template: function(row) {
					    if (row['hora'] == undefined) {
					        return 'Sin registro';
					    } else {
					        return row['hora'];
					    }
					},
				},
				{
					field: 'agente',
					title: 'Agente',
					autoHide: false,
					template: function(row) {
					    return row['nombre'] + ' ' + row['apellido']
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

var KTDatatableChildDenuncias = function() {

	// demo initializer
	var demo = function() {

		var datatable = $('#kt_datatable_2').KTDatatable({
			// datasource definition
			data: {
				type: 'remote',
				source: {
					read: {
						url: 'http://127.0.0.1:8000' + '/ciudadano/denuncias/?id=' + id,
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
					field: 'denuncia',
					title: 'Nº',
					autoHide: false,
					template: function(row) {
						return '<a href="../ciudadano/denuncia/?id=' + row['id'] + '">' + row['id'] + '</a>';
					},
				},
				{
					field: 'fecha',
					title: 'Fecha',
					sortable: 'asc',
					autoHide: false,
					template: function(row) {
					    return row['fecha'];
					},
				},
				{
					field: 'hora',
					title: 'Hora',
					autoHide: false,
					template: function(row) {
					    return row['hora'];
					},
				},
				{
					field: 'agente',
					title: 'Agente',
					autoHide: false,
					template: function(row) {
					    return row['agente'];
					},
				},
                {
					field: 'estado',
					title: 'Estado',
					autoHide: false,
					template: function(row) {
					    var status = {
							0: {'title': 'Abierta', 'style': 'background: #94E98B'},
							1: {'title': 'Cerrada', 'style': 'background: #F3ADAA'},
						};
                        return '<span class="label font-weight-bold label-lg label-inline" style="' + status[row['estado']].style + '" >' + status[row['estado']].title + '</span>'
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

var KTDatatableChildLicencias = function() {

	// demo initializer
	var demo = function() {

		var datatable = $('#kt_datatable_3').KTDatatable({
			// datasource definition
			data: {
				type: 'remote',
				source: {
					read: {
						url: 'http://127.0.0.1:8000' + '/ciudadano/licencias/?id=' + id,
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
					field: 'licencia',
					title: 'Licencia',
					autoHide: false,
					template: function(row) {
						return '<a href="../ciudadano/licencia/?id=' + row['id'] + '">' + row['descripcion'] + '</a>';
					},
				},
				{
					field: 'fecha',
					title: 'Fecha',
					sortable: 'asc',
					autoHide: false,
					template: function(row) {
					    return row['fecha'];
					},
				},
				{
					field: 'hora',
					title: 'Hora',
					autoHide: false,
					template: function(row) {
					    return row['hora'];
					},
				},
				{
					field: 'agente',
					title: 'Agente',
					autoHide: false,
					template: function(row) {
					    return row['agente'];
					},
				},
                {
					field: 'estado',
					title: 'Estado',
					autoHide: false,
					template: function(row) {
					    var status = {
							0: {'title': 'Abierta', 'style': 'background: #94E98B'},
							1: {'title': 'Cerrada', 'style': 'background: #F3ADAA'},
						};
                        return '<span class="label font-weight-bold label-lg label-inline" style="' + status[row['estado']].style + '" >' + status[row['estado']].title + '</span>'
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
			// init demo
			demo();
		},
	};
}();

jQuery(document).ready(function() {
	KTDatatableChildRemoteDataDemo.init();
});
