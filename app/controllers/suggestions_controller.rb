require 'open-uri'

class SuggestionsController < ApplicationController

  # comment this out if you want to see the styling locally
  layout false

  def new
#    params[:url] = "http://grasshopperherder.com" #uncomment this if you want to load up /suggestions/new for local testing
    raise 'Expected params[:url]' unless params[ :url ]
    begin
      before_html = open( params[ :url ] ).read
    rescue Errno::ENOENT => e
      if params[ :url ] && e.to_s.match( /No such file or directory|403 Forbidden/ )
        flash[ :error ] = "Sorry, we had trouble when trying to retrieve #{ params[ :url ].inspect }"
        redirect_to root_path and return
      else
        raise e
      end
    end
    @suggestion = Suggestion.create!( :url => params[ :url ], :before_html => before_html )
    log_activity(request.request_uri, "Began Creating", "Suggestion")
  end

  def update
    @suggestion = Suggestion.find(params[:id])
    @suggestion.update_attributes( params[:suggestion] )

    if @suggestion.save
      log_activity(request.request_uri, "Created", "Suggestion", @suggestion)
      send_suggestion_email
      log_activity(request.request_uri, "Created", "SuggestionMessage")
      flash[:success] = 'Your suggestion has been sent!'
      redirect_to(contact_thanks_url)
    else
      render :action => "new"
    end
  end

  def send_suggestion_email
    UserMailer.send_suggestion(@suggestion).deliver
  end

end
