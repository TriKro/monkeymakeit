class AdminController < ApplicationController
  load_and_authorize_resource :class => AdminController

  before_filter lambda {
    session[:admin] = true
  }

  def index
  end

  def set_experiment
    session[:experiments] = {} if session[:monkey_experiments].nil?
    session[:experiments][params[:name]] = { :version => params[:version], :set => false } if !params[:name].nil?
  end

  def clear_experiments
    session[:experiments] = nil
    render :action => 'set_experiment'
  end

end
