var ready;
ready = function() {

// $('#inrs').DataTable({
//   "iDisplayLength": 100,
//   "aaSorting": [],
//   "order": []
// });

var inrs = $('#inrs').DataTable({
  "stateSave": true,
  "iDisplayLength": 100,
  "aaSorting": [],
  "dom": 'Bfrtip',
  "colReorder": true,
  "colReorder": {
    fixedColumnsLeft: 1
  },
  "buttons": [{
    extend: 'colvis',
    columns: ':gt(1)'
  },
    'csv' 
  ],
  "fixedColumns": true,
  "fixedColumns": {
    leftColumns: 1
  },
  fixedHeader: true,
  "pageLength": 5,
  "scrollX": true,
  "order": [[ 0, 'desc' ]],
  "columns": [
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true }
  ]
});

var inrsEditable = $('#inrs_editable').DataTable({
  "stateSave": true,
  "iDisplayLength": 100,
  "aaSorting": [],
  "dom": 'Bfrtip',
  "colReorder": true,
  "colReorder": {
    fixedColumnsLeft: 1
  },
  "buttons": [{
    extend: 'colvis',
    columns: ':gt(1)'
  },
    'csv' 
  ],
  "fixedColumns": true,
  "fixedColumns": {
    leftColumns: 1
  },
  fixedHeader: true,
  "pageLength": 5,
  "scrollX": true,
  "order": [[ 0, 'desc' ]],
  "columns": [
    { "sortable": false, "searchable": false },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true }
  ]
});

var testStripRequests = $('#test_strip_requests').DataTable({
  "stateSave": true,
  "iDisplayLength": 100,
  "aaSorting": [],
  "dom": 'Bfrtip',
  "colReorder": true,
  "colReorder": {
    fixedColumnsLeft: 2
  },
  "buttons": [{
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
  "pageLength": 5,
  "scrollX": true,
  "order": [[ 0, 'desc' ]],
  "columns": [
    { "sortable": false, "searchable": false },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true }
  ]
});

var patientNotes = $('#patient_notes').DataTable({
  "stateSave": true,
  "iDisplayLength": 100,
  "aaSorting": [],
  "dom": 'Bfrtip',
  "colReorder": true,
  "colReorder": {
    fixedColumnsLeft: 1
  },
  "buttons": [{
    extend: 'colvis',
    columns: ':gt(1)'
  },
    'csv' 
  ],
  "fixedColumns": true,
  "fixedColumns": {
    leftColumns: 1
  },
  fixedHeader: true,
  "pageLength": 5,
  "scrollX": true,
  "order": [[ 0, 'desc' ]],
  "columns": [
    { "sortable": true, "searchable": false },
    { "sortable": false, "searchable": false },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true }
  ]
});

var patientNotesEditable = $('#patient_notes_editable').DataTable({
  "stateSave": true,
  "iDisplayLength": 100,
  "aaSorting": [],
  "dom": 'Bfrtip',
  "colReorder": true,
  "colReorder": {
    fixedColumnsLeft: 3
  },
  "buttons": [{
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
  "pageLength": 5,
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
    { "sortable": true, "searchable": true }
  ]
});

var doctorTable = $('#doctors-table').DataTable({
  "stateSave": true,
  "iDisplayLength": 100,
  "aaSorting": [],
  "dom": 'Bfrtip',
  "colReorder": true,
  "colReorder": {
    fixedColumnsLeft: 2
  },
  "buttons": [{
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
  "pageLength": 5,
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
  "pageLength": 5,
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

var staffTable = $('#staff-table').DataTable({
  "stateSave": true,
  "iDisplayLength": 100,
  "aaSorting": [],
  "dom": 'Bfrtip',
  "colReorder": true,
  "colReorder": {
    fixedColumnsLeft: 3
  },
  "buttons": [{
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
  "pageLength": 5,
  "scrollX": true,
  "order": [[ 0, 'desc' ]],
  "columns": [
    { "sortable": true, "searchable": false },
    { "sortable": false, "searchable": false },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true }
  ]
});

var repTable = $('#rep-table').DataTable({
  "stateSave": true,
  "iDisplayLength": 100,
  "aaSorting": [],
  "dom": 'Bfrtip',
  "colReorder": true,
  "colReorder": {
    fixedColumnsLeft: 3
  },
  "buttons": [{
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
  "pageLength": 5,
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
    { "sortable": true, "searchable": true }
  ]
});

var usersTable = $('#users-table').DataTable({
  "stateSave": true,
  "iDisplayLength": 100,
  "aaSorting": [],
  "dom": 'Bfrtip',
  "colReorder": true,
  "colReorder": {
    fixedColumnsLeft: 4
  },
  "buttons": [{
    extend: 'colvis',
    columns: ':gt(2)'
  },
    'csv' 
  ],
  "fixedColumns": true,
  "fixedColumns": {
    leftColumns: 4
  },
  fixedHeader: true,
  "pageLength": 5,
  "scrollX": true,
  "order": [[ 0, 'desc' ]],
  "columns": [
    { "sortable": true, "searchable": false },
    { "sortable": false, "searchable": false },
    { "sortable": false, "searchable": false },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true }
  ]
});

var doctorsDashbaordTable = $('#doctors-dashboard-table').DataTable({
  "stateSave": true,
  "iDisplayLength": 100,
  "aaSorting": [],
  "dom": 'Bfrtip',
  "colReorder": true,
  "colReorder": {
    fixedColumnsLeft: 1
  },
  "buttons": [{
    extend: 'colvis',
    columns: ':gt(1)'
  },
    'csv' 
  ],
  "fixedColumns": true,
  "fixedColumns": {
    leftColumns: 1
  },
  fixedHeader: true,
  "pageLength": 5,
  "scrollX": true,
  "order": [[ 0, 'desc' ]],
  "columns": [
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true },
    { "sortable": true, "searchable": true }
  ]
});

testStripRequests.state.clear();
patientNotesEditable.state.clear();

};

  $(document).ready(ready);
  $(document).on('page:load', ready);