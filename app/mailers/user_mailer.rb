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
    @suggestion = suggestion
    suggestion_message = ContactMessage.new
    suggestion_message.subject = "Suggested edit to #{@suggestion.url}"
    suggestion_message.sender_name = "SuggestEdit.org"
    suggestion_message.sender_email =  "team@suggestedit.org"
    suggestion_message.recipient_name = "SuggestEdit Team"
    suggestion_message.recipient_email = "team@suggestedit.org"
    mail :to => suggestion_message.recipient,
          :from => suggestion_message.sender,
          :reply_to => suggestion_message.sender,
          :subject => suggestion_message.subject
  end

end
