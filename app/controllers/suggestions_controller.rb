class SuggestionsController < ApplicationController

  def new
    @suggestion = Suggestion.new
    Activity.add(current_actor, request.request_uri, "Began Creating", "Suggestion") # log the Activity
  end

  def create
    @suggestion = Suggestion.new(params[:suggestion])

    if @suggestion.save
      Activity.add(current_actor, request.request_uri, "Created", "Suggestion", @suggestion) # log the Activity
      redirect_to(root_url, :notice => 'Suggestion was successfully created.')
    else
      render :action => "new"
    end
  end

end