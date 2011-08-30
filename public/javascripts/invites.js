$(document).ready(function() {

    $('#invite_message_recipients').focus(function() {
        if ($(this).val() == "Your friend's email address" ) {
          $(this).addClass('black').removeClass('grey');
          $(this).val('');
        }
      });

    $('#invite_message_to').blur(function() {
      if ($(this).val() == '') {
        $(this).addClass('grey').removeClass('black');
        $(this).val("Your friend's email address");
      }
    });

    $('#invite_message_content').focus(function() {
          $(this).addClass('black').removeClass('grey');
      });

    $('#invite_message_content').blur(function() {
        $(this).addClass('grey').removeClass('black');
    });

    $('#invite_submit').click(function() {
      if ($(this).val() == "Your friend's email address" ) {
        $(this).val('');
       };
    });

});
