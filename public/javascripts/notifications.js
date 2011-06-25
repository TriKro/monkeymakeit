Notifications = {
  show_any : function() {
    $('.notice, .alert, .success, .info').delay(400).slideDown(300);
  },
  handle_close : function() {
    $('.close').live('click', function() {
        $(this).parent().slideUp(300)
    });
  }
}

$(document).ready(function() {
    $(function () {
        Notifications.show_any();
    });
    $(function () {
        Notifications.handle_close();
    });
});