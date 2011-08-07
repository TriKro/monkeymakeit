class UserMailer < ActionMailer::Base

  default :from => "no-reply@monkeymake.it"

  def contact_us(contact_message)
    @contact_message = contact_message
    mail :to => "Monkeys@MonkeyMake.it",
         :from => "no-reply@monkeymake.it",
         :reply_to => @contact_message.sender,
         :subject => @contact_message.subject
  end

  def invite(sender, recipient, subject, url)
    @recipient = recipient
    @sender = sender
    mail :from => sender.email_header, :to => recipient.email, :subject => subject, :url => url
  end

  def invite_email(from, to, subject, message)
    @message = message
    
    mail :from => from,
         :to => to,
         :subject => subject
  end

end
