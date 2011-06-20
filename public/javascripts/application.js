var darkgrey = '#666', black = '#000'; // keep sync'd with base.sass

$(document).ready(function() {

  $('#suggestion_email').focus(function() {
    if ($('#suggestion_email').val() == "What's your email address?" ) {
      $('#suggestion_email').css('color', black);
      $('#suggestion_email').val('');
    }
  });

  $('#suggestion_submit').click(function() {
    if ($('#suggestion_email').val() == "What's your email address?" ) {
      $('#suggestion_email').css('color', black);
      $('#suggestion_email').val('');
    }
  });

  $('#suggestion_email').blur(function() {
    if ($('#suggestion_email').val() == '') {
      $('#suggestion_email').css('color', darkgrey);
      $('#suggestion_email').val("What's your email address?");
    }
  });


  $('#user_email').focus(function() {
    if ($('#user_email').val() == "Enter your email for custom code" ) {
      $('#user_email').css('color', black);
      $('#user_email').val('');
    }
  });

  $('#user_submit').click(function() {
    if ($('#user_email').val() == "Enter your email for custom code" ) {
      $('#user_email').css('color', black);
      $('#user_email').val('');
    }
  });

  $('#user_email').blur(function() {
    if ($('#user_email').val() == '') {
      $('#user_email').css('color', darkgrey);
      $('#user_email').val("Enter your email for custom code");
    }
  });

});
