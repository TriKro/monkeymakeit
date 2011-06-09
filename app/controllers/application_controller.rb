class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound do |e|
    flash[:error] = "That record does not exist!"
    Activity.add(current_actor, request.request_uri, "Record not Found") # log the Activity
    redirect_to :back
  end

  private

  # returns a unique identifier for the currently active user,
  # regardless if they have an account or not
  def current_actor
    current_user || session[:session_id]
  end

end
