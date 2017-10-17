$(document).ready(function(){
    // $('.table').DataTable({
    //   "iDisplayLength": 100,
    //   "aaSorting": [],
    //   "order": []
    // });

 // <th>ID</th>
 // <th>User Details</th>
 // <th>Last Contacted</th>
 // <th>Date of Initial Contact</th>
 // <th>First Reported INR</th>
 // <th>Qualified</th>
 // <th>Communication preferred</th>
 // <th>Insurance verification</th>
 // <th>Prescription acquired</th>
 // <th>Field Rep(s) Assigned</th>
 // <th>Doctor(s)</th>

 // <th>Date of initial call to doctor</th>
 // <th>Date of script being approved</th>
 // <th>Date of shipped device</th>
 // <th>Date of field rep being assigned</th>
 // <th>Training date</th>
 // <th>Generate shipping label</th>
 // <th></th>

    var table = $('#patient-table').DataTable({
    	"stateSave": true,
      "iDisplayLength": 100,
      "aaSorting": [],
      "dom": 'Bfrtip',
      "colReorder": true,
      "colReorder": {
        fixedColumnsLeft: 2
      },
			"buttons": [ 
				// {
	   //       text: 'Toggle Table/Card View',
	   //       action: function ( e, dt, node, config ) {
	   //           $("#patient-table").toggleClass('cards')
	   //           $("#patient-table thead").toggle();
	   //       }, 
	   //    },
       	{
        	extend: 'colvis',
        	columns: ':gt(1)'
        },
       'csv' 
			],
			"fixedColumns": true,
			"fixedColumns": {
	      leftColumns: 2
	    },
	    fixedHeader: true,
	    // "responsive": true,
	    // "bAutoWidth": true,
	    // "scrollCollapse": true,
	    "scrollY": '400px',
			"scrollX": true,
			// "lengthChange": true,
			"order": [[ 0, 'desc' ]],
			"columnDefs": [
			  { "title": "ID", "targets": 0 },
			  { "title": "User Details", "targets": 1 }
			],
      "columns": [
      	{ "sortable": true, "searchable": false },
        { "sortable": false, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": false, "searchable": false }
      ]
    });

		table.column(0).title();
		table.columns.adjust().draw();



});
