require 'open-uri'
require_dependency 'html_page'

class SuggestionsController < ApplicationController

  layout false

  def new
    raise 'Expected params[:url]' unless params[ :url ]
    begin
      html = open( params[ :url ] ).read
    rescue Errno::ENOENT => e
      if params[ :url ] && e.to_s.match( /No such file or directory|403 Forbidden/ )
        flash[ :error ] = "Sorry, we had trouble when trying to retrieve #{ params[ :url ].inspect }"
        redirect_to root_path and return
      else
        raise e
      end
    end
    content = HtmlPage.new( html, params[ :url ] ).to_text
    @suggestion = Suggestion.new( :content => content )
    Activity.add(current_actor, request.request_uri, "Began Creating", "Suggestion") # log the Activity
  end

  def create
    @suggestion = Suggestion.new(params[:suggestion])

    if @suggestion.save
      Activity.add(current_actor, request.request_uri, "Created", "Suggestion", @suggestion) # log the Activity
      send_suggestion_email
      Activity.add(current_actor, request.request_uri, "Created", "SuggestionMessage") # log the Activity
      flash[:success] = 'Your suggestion has been sent!'
      redirect_to(contact_thanks_url)
    else
      render :action => "new"
    end

  end

  def send_suggestion_email
    @suggestion_message = ContactMessage.new
    @suggestion_message.subject = "Suggested edit" + ( @suggestion.email.present? ? " from #{@suggestion.email.inspect}" : '' )
    @suggestion_message.content = @suggestion.content
    @suggestion_message.sender_name = "SuggestEdit.org"
    @suggestion_message.sender_email =  "team@suggestedit.org"
    @suggestion_message.recipient_name = "SuggestEdit Team"
    @suggestion_message.recipient_email = "team@suggestedit.org"
    UserMailer.send_suggestion(@suggestion_message).deliver
  end

end