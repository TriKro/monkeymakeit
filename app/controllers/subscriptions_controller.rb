class SubscriptionsController < ApplicationController
  load_and_authorize_resource
  cache_sweeper :user_sweeper, :subscription_sweeper

  def create
    @story = Story.find_by_id(params[:story_id])
    if (@user = current_user).nil?
      @user = User.find_or_create_from_email_and_attributes(params[:user][:email], { :full_name => params[:user][:full_name] })
      render "stories/show" and return if @user.errors.any?
      redirect_to :signin, :alert => "Please use this page to sign in as an author or admin." and return if @user.access == "author" || @user.access == "admin"
      session[:user_id] = @user.id # Log the user in
    end
    @referral_invite = Invite.find_by_code(session[:referral_code]) and session[:referral_code] = nil if session[:referral_code]
    @referral_invite.user.invitees << @user if @referral_invite
    @user.subscribed_stories << @story if !@user.subscribed_stories.find_by_id(@story.id)
    @invite = @user.invites.find_or_create_by_story_id(@story.id)
    redirect_to invite_path(@invite)
  end

end