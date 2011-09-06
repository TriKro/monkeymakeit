class AdminController < ApplicationController
  load_and_authorize_resource :class => AdminController

  before_filter lambda {
    session[:admin] = true
  }

  def index
  end

  def set_experiment
    session[:monkey_experiments] = { } if session[:monkey_experiments].nil?
    session[:monkey_experiments][params[:name]] = params[:version]
  end

  def clear_experiments
    session[:monkey_experiments] = nil
    render :action => 'set_experiment'
  end

end
