class UserMailer < ActionMailer::Base

  default :from => "no-reply@suggestedit.com"

  def contact_us(contact_message)
    @contact_message = contact_message
    mail :to => "TK@TristanKromer.com",
         :from => "no-reply@suggestedit.com",
         :reply_to => @contact_message.sender,
         :subject => @contact_message.subject
  end

end
