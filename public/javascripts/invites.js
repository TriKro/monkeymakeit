$(document).ready(function() {

    $('#email_recipients').focus(function() {
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

    $('#email_content').focus(function() {
          $(this).addClass('black').removeClass('grey');
      });

    $('#email_content').blur(function() {
        $(this).addClass('grey').removeClass('black');
    });

    $('#invite_submit').click(function() {
      if ($(this).val() == "Your friend's email address" ) {
        $(this).val('');
       };
    });

});
