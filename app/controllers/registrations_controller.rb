class RegistrationsController < ApplicationController

  def create
    @signup = User.find_by_email(params[:user][:email])
    unless @signup
      @user = @signup = User.new(params[:user])
      unless @signup.save
        redirect_to root_path
        return
      end
    end
    session[:user] = @signup
    log_activity(request.request_uri, "Registered", "User", @signup)
    log_activity(request.request_uri, "Created", "User", @signup)
    redirect_to(registration_thanks_url)
  end

  def thanks
  end

end