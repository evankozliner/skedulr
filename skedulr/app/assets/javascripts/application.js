// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap-sprockets
//= require moment 
//= require bootstrap-datetimepicker
//= require fullcalendar

$(document).ready(function() {
  $('#calendar').fullCalendar({
    header: {
            left: 'prev,next ',
            center: 'title',
            right: 'month,agendaWeek,basicDay'
    },
    defaultView: 'agendaWeek',
    height: 400,
    events: handleEventData
  });
});

handleEventData = function(start, end, timezone, callback) {
  $.get('shifts/by_business/' + $('#hidden-business-id').data('business_id'))
    .done(function(res) {
      var events = [];
      console.log(res);

      for (var i = 0; i < res.length; i++) {
        console.log(res[i]);
        events.push({
          // TODO Currently hardcoded, name optional?
          title: "Shift",
          start: res[i][0].split(".")[0],
          end: res[i][1].split(".")[0]
        });
      }
      callback(events);
  });
}
