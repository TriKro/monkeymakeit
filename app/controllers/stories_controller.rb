class StoriesController < ApplicationController

  before_filter lambda {
    km_log_page_view('story')
  }

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])

    # Bullshit cruft until artwork model is in.
    if @story.title == "Oh, Mighty Hiccup!"
      @content = "hiccup"
      @art = {
          :artwork => "/images/stories/cover-hiccup-chapter1.png",
          :artwork_title => "Untitled",
          :artist => "Tyler Landry",
      }
    elsif @story.title == "Life of the Gallows"
      @content = "life_of_the_gallows"
      @art = {
        :artwork => "/images/stories/image-life_of_the_gallows.jpg",
        :artwork_title => "Jester",
        :artist => "Tyler Landry",
      }
    elsif @story.title == "Doris"
      @content = "doris"
      @art = {
        :artwork => "/images/stories/image-doris.jpg",
        :artwork_title => "Doris",
        :artist => "Tyler Landry",
      }
    end
  end

  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(params[:story])

    if @story.save
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