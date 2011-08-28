class UserMailer < ActionMailer::Base

  default :from => "no-reply@monkeymake.it"

  def contact_us(contact_message)
    @contact_message = contact_message
    mail :to => "Monkeys@MonkeyMake.it",
         :from => "no-reply@monkeymake.it",
         :reply_to => @contact_message.sender,
         :subject => @contact_message.subject
  end

  def invite_email(from, to, subject, message)
    @message = message
    
    mail :from => from,
         :to => to,
         :subject => subject
  end

  def welcome_email(recipient)
    @recipient = recipient
    mail :from => 'Monkeys <no-reply@MonkeyMake.it>',
         :to => recipient.email
  end

end
