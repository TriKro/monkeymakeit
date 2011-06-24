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


  $('#signup_box #user_email').focus(function() {
    if ($('#signup_box #user_email').val() == "Enter your email for custom code" ) {
      $('#signup_box #user_email').css('color', black);
      $('#signup_box #user_email').val('');
    }
  });

  $('#signup_box #user_submit').click(function() {
    if ($('#signup_box #user_email').val() == "Enter your email for custom code" ) {
      $('#signup_box #user_email').css('color', black);
      $('#signup_box #user_email').val('');
    }
  });

  $('#signup_box #user_email').blur(function() {
    if ($('#signup_box #user_email').val() == '') {
      $('#signup_box #user_email').css('color', darkgrey);
      $('#signup_box #user_email').val("Enter your email for custom code");
    }
  });

  $('#invitation #user_full_name').focus(function() {
    if ($('#invitation #user_full_name').val() == "name" ) {
      $('#invitation #user_full_name').css('color', black);
      $('#invitation #user_full_name').val('');
    }
  });

  $('#invitation #user_full_name').blur(function() {
    if ($('#invitation #user_full_name').val() == '') {
      $('#invitation #user_full_name').css('color', darkgrey);
      $('#invitation #user_full_name').val("name");
    }
  });

  $('#invitation #user_email').focus(function() {
    if ($('#invitation #user_email').val() == "email" ) {
      $('#invitation #user_email').css('color', black);
      $('#invitation #user_email').val('');
    }
  });

  $('#invitation #user_email').blur(function() {
    if ($('#invitation #user_email').val() == '') {
      $('#invitation #user_email').css('color', darkgrey);
      $('#invitation #user_email').val("email");
    }
  });

  $('#invitation #user_submit').click(function() {
    if ($('#invitation #user_email').val() == "email" ) {
      $('#invitation #user_email').css('color', black);
      $('#invitation #user_email').val('');
    }
    $.ajax({
      url: '/invitations',
      type: 'post',
      data: {
        'user[email]': $('#user_email').val(),
        'user[full_name]': $('#user_full_name').val(),
        authenticity_token: $('input[name="authenticity_token"]').val(),
      },
    })
    $('#invite').fadeOut();
    return false;
  });

});
