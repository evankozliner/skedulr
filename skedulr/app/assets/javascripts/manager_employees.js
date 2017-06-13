// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $('#unmanaged-employees-section').on('click', '.add-employee-to-manager', function () {
    var employee_id = $(this).data("id");
    $.post( "/manager_employees", { id: employee_id }, function( data ) {
      var managed_id = "#managed-" + employee_id;
      var unmanaged_id = "#unmanaged-" + employee_id;

      //Find relevent employee from returned data and append
      var managed_employee = $( data ).find(managed_id);
      $('#managed-employees').append(managed_employee);

      //Remove employee from unmanaged employees list
      $(unmanaged_id).remove();
    });
  });

  $('#managed-employees-section').on('click','.remove-employee-from-manager', function () {
    var employee_id = $(this).data("id");
    console.log(employee_id);
    ajaxRemove(employee_id);
  });
});

function ajaxRemove(employee_id) {
  $.ajax({
    method: "POST",
    url: "/manager_employees/delete",
    data: { _method: "delete", id: employee_id },
    success: function(data) {
      var managed_id = "#managed-" + employee_id;
      var unmanaged_id = "#unmanaged-" + employee_id;

      //Find relevent employee from returned data and append
      var unmanaged_employee = $( data ).find(unmanaged_id);
      $('#unmanaged-employees').append(unmanaged_employee);

      //Remove employee from unmanaged employees list
      $(managed_id).remove();
    }
  })
    .fail(function(data) {
      console.log(data);
    });
}
