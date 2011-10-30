class ChaptersController < ApplicationController
  load_and_authorize_resource :story
  load_and_authorize_resource :chapter, :through => :story
  cache_sweeper :chapter_sweeper

  before_filter lambda {
    log_page_view('chapter') if request.get?
  }, :only => :show

  def index
    @story = Story.find(params[:story_id])
    @chapters = @story.chapters
  end

  def show
    @story = Story.find(params[:story_id])
    @chapter = @story.chapters.find(params[:id])
    @creatives = @chapter.creatives.sort_by(&:id)
    @user = User.new unless current_user
    if current_user && current_user.subscribed?(@story)
      @invite = current_user.invites.find_or_create_by_story_id(@story.id)
      @invite_message = InviteMessage.new
    end
    render 'show_experiment' if session[:experiments]['chapter layout'] == 'no right column'
  end

  def new
    @story = Story.find(params[:story_id])
    @chapter = Chapter.new
  end

  def edit
    @story = Story.find(params[:story_id])
    @chapter = @story.chapters.find(params[:id])
  end

  def update
    @story = Story.find(params[:story_id])
    @chapter = @story.chapters.find(params[:id])

    if @chapter.update_attributes(params[:chapter])
      redirect_to(story_chapters_url(@story), :notice => 'Chapter was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def create
    @story = Story.find(params[:story_id])
    @chapter = Chapter.new(params[:chapter])

    if @story.chapters << @chapter
      redirect_to(story_chapters_url(@story), :notice => 'Chapter was successfully created.')
    else
      render :action => "new"
    end
  end

  def destroy
    @story = Story.find(params[:story_id])
    @chapter = @story.chapters.find(params[:id])
    @chapter.destroy
    redirect_to(story_chapters_url(@story), :notice => 'Chapter was successfully destroyed.')
  end

end
