class UserMailer < ActionMailer::Base

  default :from => "no-reply@suggestedit.com"

  def contact_us(contact_message)
    @contact_message = contact_message
    mail :to => "TK@TristanKromer.com",
         :from => "no-reply@suggestedit.com",
         :reply_to => @contact_message.sender,
         :subject => @contact_message.subject
  end

  def send_suggestion(suggestion)
    @suggestion_message = suggestion
    mail :to => @suggestion_message.recipient,
         :from => "no-reply@suggestedit.com",
         :reply_to => @contact_message.sender,
         :subject => "You have a new suggested edit!"
  end

end
