class CroutsController < ApplicationController

  before_filter lambda {
    log_activity(request.request_uri, "Viewed", "Page")
  }

  def doris
    @message = { :msg => "Welcome to collaborative story writing for professionals and enthusiasts. This story is looking for: ",
                 :tags => ["feedback", "illustration", "a publisher", "collaborators"] }
    crout_doris
    related_crouts
    render (rand > 0.5 ? 'crout-7' : 'crout-8')
  end

  def hiccup
    @message = { :msg => "Welcome to collaborative story writing for professionals and enthusiasts. This story is looking for: ",
                 :tags => ["feedback on characters", "editing", "collaborators"] }
    crout_hiccup
    related_crouts
    render (rand > 0.5 ? 'crout-7' : 'crout-8')
  end

  def heart
    @message = { :msg => "Welcome to collaborative story writing for professionals and enthusiasts. This story is looking for: ",
                 :tags => ["feedback", "editing", "collaborators"] }
    crout_heart_of_the_sun
    related_crouts
    render (rand > 0.5 ? 'crout-7' : 'crout-8')
  end

  def life_of_the_gallows
    @message = { :msg => "Welcome to collaborative story writing for professionals and enthusiasts. This story is looking for: ",
                 :tags => ["feedback", "editing", "a publisher", "collaborators"] }
    crout_life_of_the_gallows
    related_crouts
    render (rand > 0.5 ? 'crout-7' : 'crout-8')
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
        :artwork_title => "Jester",
        :artist => "Tyler Landry",
        :artist_avatar => "images/avatars/avatar-tyler-landry.png"
    }
  end

  def crout_heart_of_the_sun
    @crout = {
        :title => "Heart of the Sun",
        :subtitle => "Love in the Time of Posthumans - An Open Source Screenplay",
        :author => "Harlan Knight Wood",
        :author_avatar => "images/avatars/avatar-harlan-knight-wood.jpg",
        :author_bio => "Harlan brings a decade of software development experience together with a diverse background including many years of work in various personal transformation systems. In addition to software, he is working on an open source spiritual science fiction film.",
        :content => "heart_of_the_sun",
        :artwork => "images/crouts/image-heart_of_the_sun.jpg",
        :artwork_title => "Luminous",
        :artist => "Adam Apollo",
        :artist_avatar => "images/avatars/avatar-adam-apollo.jpg"
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
        :artwork_title => "Crows",
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
        { :title => "Heart of the Sun",
          :subtitle => "Love in the Time of Posthumans - An Open Source Screenplay",
          :cover => "images/crouts/thumbnail-heart_of_the_sun.png",
          :url => heart_path,
        },
    ]
    @related.delete_if{ |crout| crout[:title] == @crout[:title] }
  end

end
