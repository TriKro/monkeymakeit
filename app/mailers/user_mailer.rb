class UserMailer < ActionMailer::Base

  default :from => 'Monkeys <monkey@monkeymake.it>'

  def email(from, to, subject, message)
    @message = message
    mail :from => from,
         :to => to,
         :subject => subject
  end

  def contact_us(contact_message)
    @contact_message = contact_message
    mail :to => "Monkeys@MonkeyMake.it",
         :reply_to => @contact_message.sender,
         :subject => @contact_message.subject
  end

  def welcome_email(recipient, story)
    @recipient = recipient
    @invite = recipient.invites.find_or_create_by_story_id(story.id)
    mail :to => recipient.email,
         :subject => "Welcome to MonkeyMake.it"
  end

  def new_subscriber_email(subscription)
    @story = subscription.story
    @author = subscription.story.user
    @subscriber = subscription.user
    @invite = @story.invites.find_or_create_by_user_id(@author.id)
    return if @author.email.nil?
    mail :to => @author.email,
         :subject => 'People like you! They really really do!'
  end

  def new_subscription_email(subscription)
    @story = subscription.story
    @author = subscription.story.user
    @user = subscription.user
    @invite = @story.invites.find_or_create_by_user_id(@user.id)
    return if @user.email.nil?
    mail :to => @user.email,
         :subject => "You've subscribed to " + @story.title
  end

  def new_chapter_email(user, story, chapter)
    @user = user
    @story = story
    @chapter = chapter
    mail :to => user.email,
         :from => @user.name_and_email,
         :subject => "Chapter #{@chapter.chapter_index} of \"#{@story.title}\" is up!"
  end

end
