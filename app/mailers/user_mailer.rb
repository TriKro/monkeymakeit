class UserMailer < ActionMailer::Base

  default :from => "no-reply@suggestedit.org"

  def contact_us(contact_message)
    @contact_message = contact_message
    mail :to => "TK@TristanKromer.com",
         :from => "no-reply@suggestedit.org",
         :reply_to => @contact_message.sender,
         :subject => @contact_message.subject
  end

  def send_suggestion(suggestion, code)
    @suggestion = suggestion
    original_author = User.find_by_code!( code )
    suggestion_message = ContactMessage.new
    suggestion_message.subject = "Suggested edit to #{@suggestion.url}"
    suggestion_message.sender_name = "SuggestEdit.org"
    suggestion_message.sender_email =  "team@suggestedit.org"
    suggestion_message.recipient_email = original_author.email
    mail :to => suggestion_message.recipient,
          :from => suggestion_message.sender,
          :reply_to => suggestion_message.sender,
          :subject => suggestion_message.subject
  end

  def invite(from, to, url)
    mail(:from => from, :to => to, :subject => 'check this out', :url => url)
  end

end
