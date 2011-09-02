class ContactMessagesController < ApplicationController

  before_filter lambda {
    log_page_view('contact') if request.get?
  }

  def new
    @contact_message = ContactMessage.new
  end

  def create
    @contact_message = ContactMessage.new(params[:contact_message])
    if @contact_message.valid?
      UserMailer.contact_us(@contact_message).deliver
      km.record('activity', { 'type' => 'contact message', 'from' => @contact_message.sender_email })
      flash[:success] = 'Your message has been sent! We\'ll reply as soon as possible.'
      redirect_to(contact_thanks_url)
    else
      render :action => 'new' # error shown in view
    end
  end

  def thanks
  end

end
