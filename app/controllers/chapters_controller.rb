class ChaptersController < ApplicationController
  load_and_authorize_resource

  before_filter lambda {
    log_page_view('chapter') if request.get?
  }, :only => :show

  def index
    @story = Story.find(params[:story_id])
    @chapters = @story.chapters
  end

  def show
    @story = Story.find(params[:story_id])
    @chapter = @story.chapters.find_by_index(1)
    @user = User.new unless current_user
    if current_user && current_user.subscribed?(@story)
      @invite = current_user.invites.find_or_create_by_story_id(@story.id)
      @invite_message = InviteMessage.new
    end
  end
end
