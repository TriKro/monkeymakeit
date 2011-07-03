$(document).ready(function() {

    $('#user_email').focus(function() {
        if ($('#user_email').val() == "Email" ) {
          $('#user_email').addClass('black').removeClass('darkgrey');
          $('#user_email').val('');
        }
      });

    $('#user_email').blur(function() {
      if ($('#user_email').val() == '') {
        $('#user_email').addClass('darkgrey').removeClass('black');
        $('#user_email').val("Email");
      }
    });

    $('#user_full_name').focus(function() {
      if ($('#user_full_name').val() == "Name" ) {
        $('#user_full_name').addClass('black').removeClass('darkgrey');
        $('#user_full_name').val('');
      }
    });

    $('#user_full_name').blur(function() {
      if ($('#user_full_name').val() == '') {
        $('#user_full_name').addClass('darkgrey').removeClass('black');
        $('#user_full_name').val("Name");
      }
    });

    $('#user_submit').click(function() {
      if ($('#user_email').val() == "Email" ) {
        $('#user_email').val('');
       };
       if ($('#user_full_name').val() == "Name" ) {
         $('#user_full_name').val('');
       }
    });

});
