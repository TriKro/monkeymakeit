$(document).ready(function() {

  var default_text = "What's your email address?";

  function clear_default_text() {
    if ($('#suggestion_email').val() == default_text ) {
      $('#suggestion_email').css('color', 'black');
      $('#suggestion_email').val('');
    }
  }

  $('#suggestion_email').focus(function() {
    clear_default_text();
  });

  $('#suggestion_submit').click(function() {
    clear_default_text();
  });

  $('#suggestion_email').blur(function() {
    if ($('#suggestion_email').val() == '') {
      $('#suggestion_email').css('color', 'grey');
      $('#suggestion_email').val(default_text);
    }
  });

});
