class CroutsController < ApplicationController

  before_filter lambda {
    log_activity(request.request_uri, "Viewed", "Page")
  }

  def doris
    crout_doris
    activities_with_thumbnails
    render 'crout'
  end

  def heart
    crout_heart_of_the_sun
    activities_with_thumbnails
    render 'crout'
  end

  def hiccup
    crout_hiccup
    activities_with_thumbnails
    render 'crout'
  end

  def life_of_the_gallows
    crout_life_of_the_gallows
    activities_with_thumbnails
    render 'crout'
  end

  def doris2
    crout_doris
    activities_with_thumbnails
    render 'crout2'
  end

  def heart2
    crout_heart_of_the_sun
    activities_with_thumbnails
    render 'crout2'
  end

  def hiccup2
    crout_hiccup
    activities_with_thumbnails
    render 'crout2'
  end

  def life_of_the_gallows2
    crout_life_of_the_gallows
    activities_with_thumbnails
    render 'crout2'
  end

  def doris3
    crout_doris
    activities_with_thumbnails
    render 'crout3'
  end

  def hiccup3
    crout_hiccup
    activities_with_thumbnails
    render 'crout3'
  end

  def heart3
    crout_heart_of_the_sun
    activities_with_thumbnails
    render 'crout3'
  end

  def life_of_the_gallows3
    crout_life_of_the_gallows
    activities_with_thumbnails
    render 'crout3'
  end

  def crout_doris
    @crout = {
        :title => "Doris",
        :subtitle => "a short story about an albino duck",
        :author => "Scott Lambridis",
        :author_avatar => "images/image-scott-lambridis.png",
        :author_bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time. You know, the usual.",
        :content => "doris",
        :artwork => "images/image-doris.jpg",
        :artwork_title => "Doris",
        :artist => "Tyler Landry",
        :artist_avatar => "images/image-alok.jpg"
    }
  end

  def crout_hiccup
    @crout = {
        :title => "Oh, Mighty Hiccup!",
        :subtitle => "about brothers, hiccups, and the end of time",
        :author => "Scott Lambridis",
        :author_avatar => "images/image-scott-lambridis.png",
        :author_bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time. You know, the usual.",
        :content => "hiccup",
        :artwork => "images/remix-hiccup/hiccup-image-campustree.png",
        :artwork_title => "Jester",
        :artist => "Tyler Landry"
    }
  end

  def crout_heart_of_the_sun
    @crout = {
        :title => "Heart of the Sun",
        :subtitle => "Love in the Time of Posthumans - An Open Source Screenplay",
        :author => "Harlan Knight Wood",
        :author_avatar => "images/image-scott-lambridis.png",
        :author_bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time. You know, the usual.",
        :content => "heart_of_the_sun",
        :artwork => "images/image-clarity.jpg",
        :artwork_title => "Clarity",
        :artist => "Harlan Knight Wood",
        :artist_avatar => "images/image-scott-lambridis.png"
    }
  end

  def crout_life_of_the_gallows
    @crout = {
        :title => "Life of the Gallows",
        :subtitle => "a short story about a medieval jester-turned-executioner",
        :author => "Scott Lambridis",
        :author_avatar => "images/image-scott-lambridis.png",
        :author_bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time. You know, the usual.",
        :content => "life_of_the_gallows",
        :artwork => "images/image-jester.jpg",
        :artwork_title => "Jester",
        :artist => "Tyler Landry"
    }
  end

  def activities_with_thumbnails
    @activities = [
        { :actor => 'Scott Lambridis',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :action_icon => 'images/remix-hiccup/thumbnail-edit.png',
          :verb => 'edited the ',
          :object => 'text',
          :details => 'Killed some bad scenes, did some general editing for cadence and flow...',
          :timestamp => '18 minutes ago'
        },
        { :actor => 'Savanah Rose',
          :actor_avatar => 'images/image-maggie.jpg',
          :action_icon => 'images/remix-hiccup/thumbnail-comment.png',
          :verb => 'said',
          :object => '',
          :details => 'I love the new picture! It fits perfectly.',
          :timestamp => '4 hours ago'
        },
        { :actor => 'Tyler Landry',
          :actor_avatar => 'images/image-adam.jpg',
          :action_icon => 'images/remix-hiccup/thumbnail-tree.png',
          :verb => 'added a',
          :object => 'picture',
          :details => 'Rough sketch of the mourning crows. These really stick in my head.',
          :timestamp => '12 hours ago'
        },
        { :actor => 'Alex Q Huffman',
          :actor_avatar => 'images/image-edward.jpg',
          :action_icon => 'images/remix-hiccup/thumbnail-music.png',
          :verb => 'updated a',
          :object => 'song',
          :details => 'Fixed the bassline.',
          :timestamp => 'Yesterday at 8:12pm'
        },
        { :actor => 'Tristan Kromer',
          :actor_avatar => 'images/image-tristan.jpg',
          :action_icon => 'images/remix-hiccup/thumbnail-branch.png',
          :verb => 'created a ',
          :object => 'branch',
          :details => 'Started a new story based on the Jane character.',
          :timestamp => 'Yesterday at 1:01pm'
        }
    ]
  end

end