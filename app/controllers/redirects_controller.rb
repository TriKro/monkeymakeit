class RedirectsController < ApplicationController
  def show
    log_activity(request.url, 'Redirected')
    redirect_to "/#{params[:path]}"
  end
end
