class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  rescue_from ActiveRecord::RecordNotFound do |e|
    flash[:error] = "That record does not exist!"
    redirect_to :back
  end

  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def access_denied
    redirect_to :back, :notice => "Please log in to continue" and return false
  end

  def km_log_page_view(type)
    km.record('viewed page', { 'page type' => type, 'url' => request.url.split("?")[0] })
  end

end
