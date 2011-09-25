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

    $( ".invite_by_email_form" ).dialog({
        autoOpen: false,
        modal: true,
        title: 'Invite Your Friends',
        width: 450
    });

    $('.email_modal_trigger').click(function() {
      $( ".invite_by_email_form" ).dialog('open');
    });

    $('.show_email_signup_form').click(function() {
      $(this).hide();
      $(this).parent().find('.social_signup').hide();
      $(this).parent().find('.email_signup_form').show();
    })

    $( "#sign_in_to_read_chapter" ).dialog({
        autoOpen: true,
        closeOnEscape: false,
        resizable: false,
        draggable: false,
        dialogClass: 'sign_in_to_read_chapter_modal',
        modal: true,
        title: 'Sign in (or Sign Up)',
        width: 600
    });

});