// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $( '.add-employee-to-manager' ).click(function () {
    var employee_id = $(this).data("id");
    $.post( "/manager_employees", { id: employee_id }, function( data ) {
      console.log(data);
      var managed_id_string = "#managed-" + employee_id;
      var unmanaged_id_string = "#unmanaged-" + employee_id;
      var employee = $( data ).find(managed_id_string);
      $('#managed-employees').append(employee);
      $(unmanaged_id_string).remove();
    });
  });

  $( '.remove-employee-from-manager' ).click(function () {


  });
});
