class SessionsController < ApplicationController
  skip_filter :store_location
  cache_sweeper :user_sweeper

  def new
    @registration = User.new
  end

  def create
    user = Authentication.find_or_create_from_hash(request.env['omniauth.auth'], current_user)
    session[:user_id] = user.id # Log the user in
    flash[:notice] = "Logged in as #{current_user.full_name}"
    redirect_to session[:return_to]
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :alert => "You've signed out!"
  end

  def failure
    redirect_to session[:return_to], :alert => "Uh oh...something weird just happened. We'll look into it. Please try to sign in again."
  end

end