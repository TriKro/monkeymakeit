$(document).ready(function() {

    $('.user_email').focus(function() {
        if ($(this).val() == "Email" ) {
          $(this).addClass('black').removeClass('darkgrey');
          $(this).val('');
        }
      });

    $('.user_email').blur(function() {
      if ($(this).val() == '') {
        $(this).addClass('darkgrey').removeClass('black');
        $(this).val("Email");
      }
    });

    $('.user_full_name').focus(function() {
      if ($(this).val() == "Name" ) {
        $(this).addClass('black').removeClass('darkgrey');
        $(this).val('');
      }
    });

    $('.user_full_name').blur(function() {
      if ($(this).val() == '') {
        $(this).addClass('darkgrey').removeClass('black');
        $(this).val("Name");
      }
    });

    $('.user_submit').click(function() {
      if ($(this).val() == "Email" ) {
        $(this).val('');
       };
       if ($(this).val() == "Name" ) {
         $(this).val('');
       }
    });

});