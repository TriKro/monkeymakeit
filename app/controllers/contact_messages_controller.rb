class ContactMessagesController < ApplicationController

  def new
    @contact_message = ContactMessage.new
    Activity.add(current_actor, request.request_uri, "Began Creating", "ContactMessage") # log the Activity
  end

  def create
    @contact_message = ContactMessage.new(params[:contact_message])
    if verify_recaptcha(@contact_message) && @contact_message.valid?
      UserMailer.contact_us(@contact_message).deliver
      Activity.add(current_actor, request.request_uri, "Created", "ContactMessage") # log the Activity
      flash[:success] = 'Your message has been sent! We\'ll reply as soon as possible.'
      redirect_to(contact_thanks_url)
    else
      render :action => 'new' # error shown in view
    end
  end

  def thanks

  end

end
