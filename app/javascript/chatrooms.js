// app/assets/javascripts/chatrooms.js

$(document).on('turbolinks:load', function() {
  $('.chatroom-link').on('ajax:success', function(event) {
    var data = event.detail[2].responseText;
    $('#chatroom-content').html(data);
  });
});
