$(document).ready(function() {

    $('.signup_via_email').click(function() {
        $('#social_signup').hide();
        $('#registration').show();
    });


    $('#email_to').focus(function() {
        if ($(this).val() == "Your friend's email address" ) {
          $(this).addClass('black').removeClass('grey');
          $(this).val('');
        }
      });

    $('#email_to').blur(function() {
      if ($(this).val() == '') {
        $(this).addClass('grey').removeClass('black');
        $(this).val("Your friend's email address");
      }
    });

    $('#email_message').focus(function() {
          $(this).addClass('black').removeClass('grey');
      });

    $('#email_message').blur(function() {
        $(this).addClass('grey').removeClass('black');
    });

    $('#invite_submit').click(function() {
      if ($(this).val() == "Your friend's email address" ) {
        $(this).val('');
       };
    });

//    Temporarily added this
//    TODO: Remove this once views are able to content_for multiple :scripts
    $('.user_email').focus(function() {
        if ($(this).val() == "Email" ) {
          $(this).addClass('black').removeClass('grey');
          $(this).val('');
        }
      });

    $('.user_email').blur(function() {
      if ($(this).val() == '') {
        $(this).addClass('grey').removeClass('black');
        $(this).val("Email");
      }
    });

    $('.user_full_name').focus(function() {
      if ($(this).val() == "Name" ) {
        $(this).addClass('black').removeClass('grey');
        $(this).val('');
      }
    });

    $('.user_full_name').blur(function() {
      if ($(this).val() == '') {
        $(this).addClass('grey').removeClass('black');
        $(this).val("Name");
      }
    });

    $('#user_submit').click(function() {
      if ($(this).val() == "Email" ) {
        $(this).val('');
       };
       if ($(this).val() == "Name" ) {
         $(this).val('');
       }
    });

});
