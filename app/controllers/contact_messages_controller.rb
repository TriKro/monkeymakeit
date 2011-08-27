class ContactMessagesController < ApplicationController

  def new
    @contact_message = ContactMessage.new
    log_activity(request.request_uri, "Began Creating", "ContactMessage")
  end

  def create
    @contact_message = ContactMessage.new(params[:contact_message])
    if @contact_message.valid?
      UserMailer.contact_us(@contact_message).deliver
      log_activity(request.request_uri, "Created", "ContactMessage")
      flash[:success] = 'Your message has been sent! We\'ll reply as soon as possible.'
      redirect_to(contact_thanks_url)
    else
      render :action => 'new' # error shown in view
      log_activity(request.request_uri, "Error Creating", "ContactMessage")
    end
  end

  def thanks
    log_activity(request.request_uri, "Viewed", "Page")
  end

end
