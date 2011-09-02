class UsersController < ApplicationController
  load_and_authorize_resource
  skip_filter :store_location, :only => :add_email
  cache_sweeper :user_sweeper

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to(users_url, :notice => 'User was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to(users_url, :notice => 'User was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def add_email
    @user = current_user
  end

  def update_email
    @user = current_user

    if @user.update_attributes(params[:user])
      redirect_to session[:return_to], :notice => 'Your email was successfully added.'
    else
      render :action => "add_email"
    end
  end

  def destroy
    @user = User.find(params[:id])
    session[:user_id] = nil if @user == current_user
    @user.destroy
    redirect_to(users_url, :notice => 'User was successfully destroyed.')
  end

end