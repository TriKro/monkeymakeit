$(document).ready(function() {

  var default_text = "What's your email address?";

  function clear_default_text(email_field) {
    if ($(email_field).val() == default_text ) {
      $(email_field).css('color', 'black');
      $(email_field).val('');
    }
  }

  $('#suggestion_email').focus(function() {
    clear_default_text('#suggestion_email');
  });

  $('#suggestion_submit').click(function() {
    clear_default_text('#suggestion_email');
  });

  $('#suggestion_email').blur(function() {
    if ($('#suggestion_email').val() == '') {
      $('#suggestion_email').css('color', 'grey');
      $('#suggestion_email').val(default_text);
    }
  });


  default_text = "Enter your email for custom code";

  $('#user_email').focus(function() {
    clear_default_text('#user_email');
  });

  $('#user_submit').click(function() {
    clear_default_text('#user_email');
  });

  $('#user_email').blur(function() {
    if ($('#user_email').val() == '') {
      $('#user_email').css('color', 'grey');
      $('#user_email').val(default_text);
    }
  });

});
