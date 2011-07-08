class CroutsController < ApplicationController

  before_filter lambda {
    log_activity(request.request_uri, "Viewed", "Page")
  }

  def doris
    redirect_to doris_3_path
  end

  def heart
    redirect_to heart_3_path
  end

  def hiccup
      redirect_to hiccup_3_path
  end

  def life_of_the_gallows
    redirect_to life_of_the_gallows_3_path
  end

  def doris_1
    crout_doris
    activities_with_thumbnails
    render 'crout-1'
  end

  def heart_1
    crout_heart_of_the_sun
    heart_activities_with_thumbnails
    render 'crout-1'
  end

  def hiccup_1
    crout_hiccup
    activities_with_thumbnails
    render 'crout-1'
  end

  def life_of_the_gallows_1
    crout_life_of_the_gallows
    activities_with_thumbnails
    render 'crout-1'
  end

  def doris_2
    crout_doris
    activities_with_thumbnails
    render 'crout-2'
  end

  def heart_2
    crout_heart_of_the_sun
    heart_activities_with_thumbnails
    render 'crout-2'
  end

  def hiccup_2
    crout_hiccup
    activities_with_thumbnails
    render 'crout-2'
  end

  def life_of_the_gallows_2
    crout_life_of_the_gallows
    activities_with_thumbnails
    render 'crout-2'
  end

  def doris_3
    crout_doris
    activities_with_thumbnails
    render 'crout-3'
  end

  def hiccup_3
    crout_hiccup
    activities_with_thumbnails
    render 'crout-3'
  end

  def heart_3
    crout_heart_of_the_sun
    heart_activities_with_thumbnails
    render 'crout-3'
  end

  def life_of_the_gallows_3
    crout_life_of_the_gallows
    activities_with_thumbnails
    render 'crout-3'
  end

    def doris_4
    crout_doris
    activities_with_thumbnails
    render 'crout-4'
  end

  def hiccup_4
    crout_hiccup
    activities_with_thumbnails
    render 'crout-4'
  end

  def heart_4
    crout_heart_of_the_sun
    heart_activities_with_thumbnails
    render 'crout-4'
  end

  def life_of_the_gallows_4
    crout_life_of_the_gallows
    activities_with_thumbnails
    render 'crout-4'
  end

  def doris_5
    crout_doris
    activities_with_thumbnails
    render 'crout-5'
  end

  def hiccup_5
    crout_hiccup
    activities_with_thumbnails
    render 'crout-5'
  end

  def heart_5
    crout_heart_of_the_sun
    heart_activities_with_thumbnails
    render 'crout-5'
  end

  def life_of_the_gallows_5
    crout_life_of_the_gallows
    activities_with_thumbnails
    render 'crout-5'
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
        :subtitle => "a novel about brothers, hiccups, and the end of time",
        :author => "Scott Lambridis",
        :author_avatar => "images/image-scott-lambridis.png",
        :artist_avatar => "images/image-oscar.jpg",
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
        :author_avatar => "images/image-harlan.jpg",
        :author_bio => "Harlan brings a decade of software development experience together with a diverse background including many years of work in various personal transformation systems. In addition to software, he is working on an open source spiritual science fiction film.",
        :content => "heart_of_the_sun",
        :artwork => "images/image-clarity.jpg",
        :artwork_title => "Luminous",
        :artist => "Adam Apollo",
        :artist_avatar => "images/image-aa.jpg"
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
        :artwork_title => "Crows",
        :artist => "Tyler Landry",
        :artist_avatar => "images/image-alok.jpg",
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
    additional_contributors
  end

  def heart_activities_with_thumbnails
    @activities = [
        { :actor => 'Adam Apollo',
          :actor_avatar => 'images/image-aa.jpg',
          :action_icon => 'images/remix-hiccup/thumbnail-tree.png',
          :verb => 'added an',
          :object => 'image',
          :details => 'Supernova, with crop circle highlights, and seven pointed rainbow star.',
          :timestamp => 'just now'
        },
        { :actor => 'Summer Shapiro',
          :actor_avatar => 'images/images-summer.jpg',
          :action_icon => 'images/remix-hiccup/thumbnail-edit.png',
          :verb => 'edited',
          :object => 'the movie',
          :details => 'Minor style and grammar edits',
          :timestamp => 'yesterday'
        },
        { :actor => 'Harlan Knight Wood',
          :actor_avatar => 'images/image-harlan.jpg',
          :action_icon => 'images/remix-hiccup/thumbnail-edit.png',
          :verb => 'remixed',
          :object => 'the movie',
          :details => 'Added more sexy character intrigue',
          :timestamp => '2 days ago'
        },
        { :actor => 'Harlan Knight Wood',
          :actor_avatar => 'images/image-harlan.jpg',
          :action_icon => 'images/remix-hiccup/thumbnail-edit.png',
          :verb => 'uploaded a',
          :object => 'movie summary',
          :details => 'A transhuman love story',
          :timestamp => '18 days ago'
        },
    ]
    additional_contributors
  end

  def additional_contributors
    @additional_contributors = @activities.map{ |activity| { :actor => activity[:actor], :actor_avatar => activity[:actor_avatar] } }.uniq
    @additional_contributors.delete_if{ |contributor| contributor[:actor_avatar] == @crout[:author_avatar] || contributor[:actor_avatar] == @crout[:artist_avatar] }
  end
end