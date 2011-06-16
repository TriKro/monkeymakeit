$(document).ready(function() {

  $('#suggestion_email').focus(function() {
    if ($('#suggestion_email').val() == "What's your email address?") {
      $('#suggestion_email').css('color', 'black');
      $('#suggestion_email').val('');
    }
  });

  $('#suggestion_submit').click(function() {
    if ($('#suggestion_email').val() == "What's your email address?") {
      $('#suggestion_email').val('');
    }
  });

  $('#suggestion_email').blur(function() {
    if ($('#suggestion_email').val() == '') {
      $('#suggestion_email').css('color', 'grey');
      $('#suggestion_email').val("What's your email address?");
    }
  });

});
