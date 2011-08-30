class UserMailer < ActionMailer::Base

  default :from => "no-reply@monkeymake.it"

  def email(from, to, subject, message)
    @message = message
    mail :from => from,
         :to => to,
         :subject => subject
  end

  def contact_us(contact_message)
    @contact_message = contact_message
    mail :to => "Monkeys@MonkeyMake.it",
         :from => "no-reply@monkeymake.it",
         :reply_to => @contact_message.sender,
         :subject => @contact_message.subject
  end

  def welcome_email(recipient, story)
    @recipient = recipient
    @invite = recipient.invites.find_or_create_by_story_id(story.id)
    mail :from => 'Monkeys <no-reply@MonkeyMake.it>',
         :to => recipient.email,
         :subject => "Welcome to MonkeyMake.it"
  end

  def new_subscriber_email(subscription)
    @story = subscription.story
    @author = subscription.story.author
    @subscriber = subscription.user
    @invite = @story.invites.find_or_create_by_user_id(@author.id)
    return if @author.email.nil?
    mail :from => 'Monkeys <no-reply@MonkeyMake.it>',
         :to => @author.email,
         :subject => 'People like you! They really really do!'
  end

  def new_subscription_email(subscription)
    @story = subscription.story
    @author = subscription.story.author
    @user = subscription.user
    @invite = @story.invites.find_or_create_by_user_id(@user.id)
    return if @user.email.nil?
    mail :from => 'Monkeys <no-reply@MonkeyMake.it>',
         :to => @user.email,
         :subject => "You've subscribed to " + @story.title
  end

end
