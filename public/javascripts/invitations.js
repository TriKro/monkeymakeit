var darkgrey = '#666', black = '#000'; // keep sync'd with base.sass

$(document).ready(function() {

  $('#invitation_email').focus(function() {
    if ($('#invitation_email').val() == "Email" ) {
      $('#invitation_email').css('color', black);
      $('#invitation_email').val('');
    }
  });

  $('#invitation_email').blur(function() {
    if ($('#invitation_email').val() == '') {
      $('#invitation_email').css('color', darkgrey);
      $('#invitation_email').val("Email");
    }
  });

  $('#invitation_name').focus(function() {
    if ($('#invitation_name').val() == "Name" ) {
      $('#invitation_name').css('color', black);
      $('#invitation_name').val('');
    }
  });

  $('#invitation_name').blur(function() {
    if ($('#invitation_name').val() == '') {
      $('#invitation_name').css('color', darkgrey);
      $('#invitation_name').val("Name");
    }
  });

  $('#invitation_submit').click(function() {
    if ($('#invitation_name').val() == "Name" ) {
      $('#invitation_name').css('color', black);
      $('#invitation_name').val('');
    };
    if ($('#invitation_email').val() == "Email" ) {
      $('#invitation_email').css('color', black);
      $('#invitation_email').val('');
    }
  });

});
