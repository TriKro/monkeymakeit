class SuggestionsController < ApplicationController

  def new
    @suggestion = Suggestion.new
    Activity.add(current_actor, request.request_uri, "Began Creating", "Suggestion") # log the Activity
  end

  def create
    @suggestion = Suggestion.new(params[:suggestion])

    if @suggestion.save
      Activity.add(current_actor, request.request_uri, "Created", "Suggestion", @suggestion) # log the Activity
    else
      render :action => "new"
    end

    @suggestion_message = ContactMessage.new
    @suggestion_message.content = params[:suggestion][:content]
    @suggestion_message.sender_name = "No name"
    @suggestion_message.sender_email = params[:suggestion][:email]
    @suggestion_message.recipient_name = "Tristan"
    @suggestion_message.recipient_email = "TK@TristanKromer.com"

    if @suggestion_message.valid?
      UserMailer.send_suggestion(@suggestion_message).deliver
      Activity.add(current_actor, request.request_uri, "Created", "SuggestionMessage") # log the Activity
      flash[:success] = 'Your suggestion has been sent!'
      redirect_to(contact_thanks_url)
    else
      render :action => 'new' # error shown in view
    end

  end

end