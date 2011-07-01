require 'open-uri'

class SuggestionsController < ApplicationController

  def new
    raise 'Expected params[:url]' unless params[ :url ]
    cookies[:url] = params[:url]
    cookies[:code] = params[:code]
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
    render :layout => 'modal'
  end

  def update
    session[:user] = User.find_by_email(params[:suggestion][:email]) || User.create!(:email => params[:suggestion][:email])
    @suggestion = Suggestion.find(params[:id])
    @suggestion.update_attributes( params[:suggestion] )

    if @suggestion.save
      log_activity(request.request_uri, "Created", "Suggestion", @suggestion)
      UserMailer.send_suggestion(@suggestion, cookies[:code]).deliver
      log_activity(request.request_uri, "Created", "SuggestionMessage")
      flash[:success] = 'Your suggestion has been sent!'
      redirect_to(suggestion_thanks_url)
    else
      render :action => "new"
    end
  end

  def thanks
    render :layout => 'modal'
    @new_user = User.new
  end

end
