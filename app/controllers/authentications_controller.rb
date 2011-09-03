class AuthenticationsController < ApplicationController
  load_and_authorize_resource

  def index
    @authentications = Authentication.order("user_id")
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    flash[:alert] = "That record was destroyed!"
    redirect_to_back_or_default
  end
end