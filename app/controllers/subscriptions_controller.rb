class SubscriptionsController < ApplicationController
  load_and_authorize_resource
  cache_sweeper :user_sweeper, :subscription_sweeper

  def create
    @user = current_user
    @story = Story.find_by_id(params[:story_id])
    @referral_invite = Invite.find_by_code(session[:referral_code]) and session[:referral_code] = nil if session[:referral_code]
    @referral_invite.referrals << Referral.new(:user_id => @user.id) if @referral_invite
    @user.subscribed_stories << @story if !@user.subscribed_stories.find_by_id(@story.id)
    @invite = @user.invites.find_or_create_by_story_id(@story.id)
    redirect_to invite_path(@invite)
  end

end