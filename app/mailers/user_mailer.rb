class UserMailer < ActionMailer::Base

  default :from => "no-reply@suggestedit.org"

  def contact_us(contact_message)
    @contact_message = contact_message
    mail :to => "TK@TristanKromer.com",
         :from => "no-reply@suggestedit.org",
         :reply_to => @contact_message.sender,
         :subject => @contact_message.subject
  end

  def send_suggestion(suggestion)
    @content = suggestion.content
    mail :to => suggestion.recipient,
          :from => suggestion.sender,
          :reply_to => suggestion.sender,
          :subject => suggestion.subject
  end

end
