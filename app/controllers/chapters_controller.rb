class ChaptersController < ApplicationController
  def show
    @story = Story.find(params[:story_id])
    @user = User.new if !current_user
    if current_user && current_user.subscribed?(@story)
      @invite = current_user.invites.find_or_create_by_story_id(@story.id)
      @invite_message = InviteMessage.new
    end
  end
end
