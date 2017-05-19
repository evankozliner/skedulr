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
//= require fullcalendar

$(document).ready(function() {
  $('#calendar').fullCalendar({
    defaultView: 'basicWeek',
    height: 400,
    events: function(start, end, timezone, callback) {
      $.get('shifts/by_business/' + $('#hidden-business-id').data('business_id'))
      //TODO extract to function
        .done(function(res) {
          var events = [];

          events.push({
            title: '',
            start: '',
            end: ''
          });

          callback(events);
      });
    }
  });
});
