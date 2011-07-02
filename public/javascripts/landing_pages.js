var darkgrey = '#666', black = '#000'; // keep sync'd with base.sass

$(document).ready(function() {

    $('#user_email').focus(function() {
        if ($('#user_email').val() == "Email" ) {
          $('#user_email').css('color', black);
          $('#user_email').val('');
        }
      });

    $('#user_email').blur(function() {
      if ($('#user_email').val() == '') {
        $('#user_email').css('color', darkgrey);
        $('#user_email').val("Email");
      }
    });

    $('#user_full_name').focus(function() {
      if ($('#user_full_name').val() == "Name" ) {
        $('#user_full_name').css('color', black);
        $('#user_full_name').val('');
      }
    });

    $('#user_full_name').blur(function() {
      if ($('#user_full_name').val() == '') {
        $('#user_full_name').css('color', darkgrey);
        $('#user_full_name').val("Name");
      }
    });

    $('#user_submit').click(function() {
      if ($('#user_email').val() == "Email" ) {
        $('#user_email').css('color', black);
        $('#user_email').val('');
       };
       if ($('#user_full_name').val() == "Name" ) {
         $('#user_full_name').css('color', black);
         $('#user_full_name').val('');
       }
    });

});
