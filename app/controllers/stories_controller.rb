class StoriesController < ApplicationController
  load_and_authorize_resource :story

  before_filter lambda {
    log_page_view('story') if request.get?
  }, :only => [:index, :show]

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
    @chapter = @story.chapters.first
    redirect_to story_chapter_path(@story, @chapter)
  end

  def new
    @story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(params[:story])

    if current_user.stories << @story
      redirect_to(stories_url, :notice => 'Story was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @story = Story.find(params[:id])

    if @story.update_attributes(params[:story])
      redirect_to(stories_url, :notice => 'Story was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to(stories_url, :notice => 'Story was successfully destroyed.')
  end

end
