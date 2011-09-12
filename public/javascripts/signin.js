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

    $('.user_name').focus(function() {
      if ($(this).val() == "Name" ) {
        $(this).addClass('black').removeClass('darkgrey');
        $(this).val('');
      }
    });

    $('.user_name').blur(function() {
      if ($(this).val() == '') {
        $(this).addClass('darkgrey').removeClass('black');
        $(this).val("Name");
      }
    });

    $('.new_user').submit(function() {
      if ($(this).find('.user_email').val() == "Email" ) {
        $('.user_email').val('');
      };
       if ($(this).find('.user_name').val() == "Name" ) {
         $('.user_name').val('');
      };
    });

    $('.show_email_signup_form').click(function() {
      $(this).hide();
      $(this).parent().find('.social_signup').hide();
      $(this).parent().find('.email_signup_form').show();
    })

});