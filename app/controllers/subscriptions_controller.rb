class SubscriptionsController < ApplicationController

  cache_sweeper :user_sweeper, :subscription_sweeper

  def create
    @user = current_user || User.find_by_email(params[:user][:email])
    @story = Story.find_by_id(params[:story_id])
    @referral_invite = Invite.find_by_code(session[:referral_code]) if session[:referral_code]
    unless @user
      @user = User.new(params[:user])
      @user.access = "reader"
      if @user.save
        # TODO: Move emailing to observer.
        UserMailer.welcome_email(@user, @story).deliver
      else
        redirect_to(params[:from]) and return
      end
    end
    session[:user_id] = @user.id if !(@user.access == "admin") # Hack to prevent users signing in as admin.
    @referral_invite.user.invitees << @user if @referral_invite
    @user.subscribed_stories << @story
    @invite = @user.invites.find_or_create_by_story_id(@story.id)
    redirect_to invite_path(@invite)
  end

end
