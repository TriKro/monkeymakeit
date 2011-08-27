class ContactMessagesController < ApplicationController

  def new
    @contact_message = ContactMessage.new
  end

  def create
    @contact_message = ContactMessage.new(params[:contact_message])
    if @contact_message.valid?
      UserMailer.contact_us(@contact_message).deliver
      flash[:success] = 'Your message has been sent! We\'ll reply as soon as possible.'
      redirect_to(contact_thanks_url)
    else
      render :action => 'new' # error shown in view
    end
  end

  def thanks
  end

end
