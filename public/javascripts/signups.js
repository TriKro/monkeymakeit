$(document).ready(function() {

  $('#signup_email').focus(function() {
    if ($('#signup_email').val() == "Email" ) {
      $('#signup_email').addClass('black').removeClass('darkgrey');
      $('#signup_email').val('');
    }
  });

  $('#signup_email').blur(function() {
    if ($('#signup_email').val() == '') {
      $('#signup_email').addClass('darkgrey').removeClass('black');
      $('#signup_email').val("Email");
    }
  });

  $('#signup_name').focus(function() {
    if ($('#signup_name').val() == "Name" ) {
      $('#signup_name').addClass('black').removeClass('darkgrey');
      $('#signup_name').val('');
    }
  });

  $('#signup_name').blur(function() {
    if ($('#signup_name').val() == '') {
      $('#signup_name').addClass('darkgrey').removeClass('black');
      $('#signup_name').val("Name");
    }
  });

  $('#user_submit').click(function() {
    if ($('#signup_name').val() == "Name" ) {
      $('#signup_name').val('');
    }
    if ($('#signup_email').val() == "Email" ) {
      $('#signup_email').val('');
    }
  });

});