// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require rails-ujs
//= require jquery 

//= require bootstrap-sprockets

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "bootstrap"
Rails.start()
Turbolinks.start()
ActiveStorage.start()

function scrollToBottom(){
  if($('#messages').length > 0) {
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
  }
}
function submitMessage(event){
  event.preventDefault();
  $('#new_message').submit();
}
$(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
  if (event.keyCode === 13) {
    submitMessage(event);
  }
});
$(document).on('click', '[data-send~=message]', function(event) {
  submitMessage(event);
});
$(document).on('turbolinks:load', function() {
  $("#new_message").on("ajax:complete", function(e, data, status) {
    $('#message_content').val('');
  })
  scrollToBottom();
});

$(document).ready(function() {
  $("#new_message").on("ajax:complete", function(e, data, status){
  	$('#message_content').val('');
  })
  scrollToBottom();
});
