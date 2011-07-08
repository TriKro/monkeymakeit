class RegistrationsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    unless @user
      @user = User.new (params[:user])
      if @user.save
        log_activity(request.request_uri, "Created", "User", @user)
        current_user = @user
        return redirect_to root_path, :notice => 'Thanks, we are working hard and will let you know when more awesomeness is ready for you.'
      else
        return redirect_to new_registration_path(:user => params[:user]), :alert => @user.errors.full_messages.first
      end
    end
  end

end
