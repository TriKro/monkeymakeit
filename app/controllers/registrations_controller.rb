class RegistrationsController < ApplicationController

  def new
    log_activity(request.request_uri, "Viewed", "Page")
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    unless @user
      @user = User.new (params[:user])
      if @user.save
        log_activity(request.request_uri, "Created", "User", @user)
        current_user = @user
        return redirect_to registration_thanks_path
      else
        log_activity(request.request_uri, "Error Creating", "User")
        return redirect_to new_registration_path(:user => params[:user]), :alert => @user.errors.full_messages.first
      end
    end
    log_activity(request.request_uri, "Error Creating", "User", @user)
    redirect_to registration_thanks_path, :notice => 'You already signed up!'
  end

  def registration_thanks
    log_activity(request.request_uri, "Viewed", "Page")
  end

end
