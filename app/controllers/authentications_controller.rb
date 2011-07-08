class AuthenticationsController < ApplicationController
  #load_and_authorize_resource

  def index
    @authentications = Authentication.all
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to(:back)
  end
end