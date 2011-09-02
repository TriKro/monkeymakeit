$(document).ready(function() {

    $('#user_email').focus(function() {
        if ($(this).val() == "Email Address" ) {
          $(this).addClass('black').removeClass('midgrey');
          $(this).val('');
        }
      });

    $('#user_email').blur(function() {
      if ($(this).val() == '') {
        $(this).addClass('midgrey').removeClass('black');
        $(this).val("Email Address");
      }
    });

    $('#user_email').click(function() {
      if ($(this).val() == "Email Address" ) {
        $(this).val('');
       };
    });
});