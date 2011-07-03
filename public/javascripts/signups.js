var darkgrey = '#666', black = '#000'; // keep sync'd with base.sass

$(document).ready(function() {

  $('#signup_email').focus(function() {
    if ($('#signup_email').val() == "Email" ) {
      $('#signup_email').css('color', black);
      $('#signup_email').val('');
    }
  });

  $('#signup_email').blur(function() {
    if ($('#signup_email').val() == '') {
      $('#signup_email').css('color', darkgrey);
      $('#signup_email').val("Email");
    }
  });

  $('#signup_name').focus(function() {
    if ($('#signup_name').val() == "Name" ) {
      $('#signup_name').css('color', black);
      $('#signup_name').val('');
    }
  });

  $('#signup_name').blur(function() {
    if ($('#signup_name').val() == '') {
      $('#signup_name').css('color', darkgrey);
      $('#signup_name').val("Name");
    }
  });

  $('#user_submit').click(function() {
    if ($('#signup_name').val() == "Name" ) {
      $('#signup_name').css('color', black);
      $('#signup_name').val('');
    }
    if ($('#signup_email').val() == "Email" ) {
      $('#signup_email').css('color', black);
      $('#signup_email').val('');
    }
  });

});