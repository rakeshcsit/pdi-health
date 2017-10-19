var ready;
ready = function() {

    $('#patient_notes, #test_strip_requests, #inrs, #staff-table, #rep-table, #users-table, #doctors-dashboard-table').DataTable({
      "iDisplayLength": 100,
      "aaSorting": [],
      "order": []
    });

 // <th>ID</th>
 // <th>Full name</th>
 // <th>Email</th>
 // <th>Phone number</th>
 // <th>Fax number</th>
 // <th>Address</th>
 // <th>State</th>
 // <th>Zipcode</th>
 // <th>Timezone</th>
 // <th>Hours</th>
 // <th>Patients</th>
 // <th></th>

     var doctorTable = $('#doctors-table').DataTable({
      "stateSave": true,
       "iDisplayLength": 100,
       "aaSorting": [],
       "dom": 'Bfrtip',
       "colReorder": true,
       "colReorder": {
         fixedColumnsLeft: 2
       },
      "buttons": [ 
          {
          extend: 'colvis',
          columns: ':gt(2)'
         },
        'csv' 
      ],
      "fixedColumns": true,
      "fixedColumns": {
        leftColumns: 3
      },
      fixedHeader: true,
      "scrollY": '400px',
      "scrollX": true,
      "order": [[ 0, 'desc' ]],
       "columns": [
        { "sortable": true, "searchable": false },
        { "sortable": false, "searchable": false },
         { "sortable": true, "searchable": true },
         { "sortable": true, "searchable": true },
         { "sortable": true, "searchable": true },
         { "sortable": true, "searchable": true },
         { "sortable": true, "searchable": true },
         { "sortable": true, "searchable": true },
         { "sortable": true, "searchable": true },
         { "sortable": true, "searchable": true },
         { "sortable": true, "searchable": true },
         { "sortable": true, "searchable": true }
       ]
     });

// <th>ID</th>
// <th></th>
// <th>Name</th>
// <th>Email</th>
// <th>Phone</th>
// <th>TimeZone</th>
// <th>Address</th>
// <th>State</th>
// <th>Zipcode</th>
// <th>Last Request For Add. Strips</th>
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

    var patientTable = $('#patient-table').DataTable({
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
        	columns: ':gt(2)'
        },
       'csv' 
			],
			"fixedColumns": true,
			"fixedColumns": {
	      leftColumns: 3
	    },
	    fixedHeader: true,
	    // "responsive": true,
	    // "bAutoWidth": true,
	    // "scrollCollapse": true,
	    "scrollY": '400px',
			"scrollX": true,
			// "lengthChange": true,
			"order": [[ 0, 'desc' ]],
			// "columnDefs": [
			//   { "title": "ID", "targets": 0 },
			//   { "title": "User Details", "targets": 1 }
			// ],
      "columns": [
      	{ "sortable": true, "searchable": false },
      	{ "sortable": false, "searchable": false },
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
        { "sortable": true, "searchable": true },
        { "sortable": true, "searchable": true },
        { "sortable": false, "searchable": false },
        { "sortable": false, "searchable": false },
        { "sortable": false, "searchable": false },
        { "sortable": false, "searchable": false },
        { "sortable": false, "searchable": false },
        { "sortable": false, "searchable": false },
        { "sortable": false, "searchable": false }
      ]
    });

};

  $(document).ready(ready);
  $(document).on('page:load', ready);