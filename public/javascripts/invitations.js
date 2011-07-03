$(document).ready(function() {

  $('#invitation_email').focus(function() {
    if ($('#invitation_email').val() == "Email" ) {
      $('#invitation_email').addClass('black').removeClass('darkgrey');
      $('#invitation_email').val('');
    }
  });

  $('#invitation_email').blur(function() {
    if ($('#invitation_email').val() == '') {
      $('#invitation_email').addClass('darkgrey').removeClass('black');
      $('#invitation_email').val("Email");
    }
  });

  $('#invitation_name').focus(function() {
    if ($('#invitation_name').val() == "Name" ) {
      $('#invitation_name').addClass('black').removeClass('darkgrey');
      $('#invitation_name').val('');
    }
  });

  $('#invitation_name').blur(function() {
    if ($('#invitation_name').val() == '') {
      $('#invitation_name').addClass('darkgrey').removeClass('black');
      $('#invitation_name').val("Name");
    }
  });

  $('#invitation_submit').click(function() {
    if ($('#invitation_name').val() == "Name" ) {
      $('#invitation_name').val('');
    };
    if ($('#invitation_email').val() == "Email" ) {
      $('#invitation_email').val('');
    }
  });

});
