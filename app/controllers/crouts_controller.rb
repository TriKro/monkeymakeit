class CroutsController < ApplicationController

  before_filter lambda {
    log_activity(request.request_uri, "Viewed", "Page")
  }

  def set_experiment_7
    session[:monkey_experiment_id] = 7
    redirect_to doris_path
  end

  def set_experiment_8
    session[:monkey_experiment_id] = 8
    redirect_to doris_path
  end

  def set_experiment_9
    session[:monkey_experiment_id] = 9
    redirect_to doris_path
  end

  def set_experiment_10
    session[:monkey_experiment_id] = 10
    redirect_to doris_path
  end

  def doris7
    crout_doris
    related_crouts
    render 'crout-7'
  end

  def doris
    crout_doris
    related_crouts
    render_experiment
  end

  def hiccup
    crout_hiccup
    related_crouts
    render_experiment
  end

  def life_of_the_gallows
    crout_life_of_the_gallows
    related_crouts
    render_experiment
  end


  def crout_doris
    @crout = {
        :title => "Doris",
        :subtitle => "a short story about an albino duck",
        :author => "Scott Lambridis",
        :author_avatar => "images/avatars/avatar-scott-lambridis.png",
        :author_bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time. You know, the usual.",
        :content => "doris",
        :artwork => "images/crouts/image-doris.jpg",
        :artwork_title => "Doris",
        :artist => "Tyler Landry",
        :artist_avatar => "images/avatars/avatar-tyler-landry.png"
    }
  end

  def crout_hiccup
    @crout = {
        :title => "Oh, Mighty Hiccup!",
        :subtitle => "a novel about brothers, hiccups, and the end of time",
        :author => "Scott Lambridis",
        :author_avatar => "images/avatars/avatar-scott-lambridis.png",
        :author_bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time. You know, the usual.",
        :content => "hiccup",
        :artwork => "images/crouts/image-hiccup.png",
        :artwork_title => "Crows",
        :artist => "Tyler Landry",
        :artist_avatar => "images/avatars/avatar-tyler-landry.png"
    }
  end

  def crout_life_of_the_gallows
    @crout = {
        :title => "Life of the Gallows",
        :subtitle => "a short story about a medieval jester-turned-executioner",
        :author => "Scott Lambridis",
        :author_avatar => "images/avatars/avatar-scott-lambridis.png",
        :author_bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time. You know, the usual.",
        :content => "life_of_the_gallows",
        :artwork => "images/crouts/image-life_of_the_gallows.jpg",
        :artwork_title => "Jester",
        :artist => "Tyler Landry",
        :artist_avatar => "images/avatars/avatar-tyler-landry.png",
    }
  end

  def related_crouts
    @related = [
        { :title => "Life of the Gallows",
          :subtitle => "a short story about a medieval jester-turned-executioner",
          :cover => "images/crouts/thumbnail-life_of_the_gallows.png",
          :url => life_of_the_gallows_path,
        },
        { :title => "Oh, Mighty Hiccup!",
          :subtitle => "a novel about brothers, hiccups, and the end of time",
          :cover => "images/crouts/thumbnail-hiccup.png",
          :url => hiccup_path,
        },
        { :title => "Doris",
          :subtitle => "a short story about an albino duck",
          :cover => "images/crouts/thumbnail-doris.png",
          :url => doris_path,
        },
    ]
    @related.delete_if{ |crout| crout[:title] == @crout[:title] }
  end

  def render_experiment
    if !session[:monkey_experiment_id]
      if rand > 0.5
        session[:monkey_experiment_id] = 8
      else
        session[:monkey_experiment_id] = 9
      end
    end
    log_activity(request.request_uri, "Viewed", "Experiment-" + session[:monkey_experiment_id].to_s )
    render 'crout-' + session[:monkey_experiment_id].to_s
   end
end
