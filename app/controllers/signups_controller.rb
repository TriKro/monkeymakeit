class SignupsController < ApplicationController

  def new
    @signup = User.new
  end

  def create
    @signup = User.new(params[:user])
    if @signup.save
# TODO: Fix logging
#      Activity.add(current_actor, request.request_uri, "Created", "User", @signup) # log the Activity
      redirect_to(new_invitation_url, :notice => 'User was successfully created.')
    else
      render :action => "new"
    end
  end

end
