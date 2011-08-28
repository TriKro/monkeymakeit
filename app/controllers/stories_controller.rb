class StoriesController < ApplicationController

  before_filter lambda {
    km_log_page_view('story')
  }

  def doris
    story_doris
    related_stories
    render_experiment
  end

  def hiccup
    story_hiccup
    related_stories
    render_experiment
  end

  def life_of_the_gallows
    story_life_of_the_gallows
    related_stories
    render_experiment
  end


  def story_doris
    @story = {
        :title => "Doris",
        :subtitle => "a short story about an albino duck",
        :author => "Scott Lambridis",
        :author_avatar => "images/avatars/avatar-scott-lambridis.png",
        :author_bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time. You know, the usual.",
        :content => "doris",
        :artwork => "images/stories/image-doris.jpg",
        :artwork_title => "Doris",
        :artist => "Tyler Landry",
        :artist_avatar => "images/avatars/avatar-tyler-landry.png"
    }
  end

  def story_hiccup
    @story = {
        :title => "Oh, Mighty Hiccup!",
        :subtitle => "a novel about brothers, hiccups, and the end of time",
        :author => "Scott Lambridis",
        :author_avatar => "images/avatars/avatar-scott-lambridis.png",
        :author_bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time. You know, the usual.",
        :content => "hiccup",
        :artwork => "images/stories/cover-hiccup-chapter1.png",
        :artwork_title => "Untitled",
        :artist => "Tyler Landry",
        :artist_avatar => "images/avatars/avatar-tyler-landry.png"
    }
  end

  def story_life_of_the_gallows
    @story = {
        :title => "Life of the Gallows",
        :subtitle => "a short story about a medieval jester-turned-executioner",
        :author => "Scott Lambridis",
        :author_avatar => "images/avatars/avatar-scott-lambridis.png",
        :author_bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time. You know, the usual.",
        :content => "life_of_the_gallows",
        :artwork => "images/stories/image-life_of_the_gallows.jpg",
        :artwork_title => "Jester",
        :artist => "Tyler Landry",
        :artist_avatar => "images/avatars/avatar-tyler-landry.png",
    }
  end

  def related_stories
    @related = [
        { :title => "Life of the Gallows",
          :subtitle => "a short story about a medieval jester-turned-executioner",
          :cover => "images/stories/thumbnail-life_of_the_gallows.png",
          :url => life_of_the_gallows_path,
        },
        { :title => "Oh, Mighty Hiccup!",
          :subtitle => "a novel about brothers, hiccups, and the end of time",
          :cover => "images/stories/thumbnail-hiccup.png",
          :url => hiccup_path,
        },
        { :title => "Doris",
          :subtitle => "a short story about an albino duck",
          :cover => "images/stories/thumbnail-doris.png",
          :url => doris_path,
        },
    ]
    @related.delete_if{ |story| story[:title] == @story[:title] }
  end

  def render_experiment
    session[:monkey_experiment_id] = 10
    render 'story-' + session[:monkey_experiment_id].to_s
   end
end
