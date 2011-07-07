class CroutsController < ApplicationController

  before_filter lambda {
    log_activity(request.request_uri, "Viewed", "Page")
  }

  def doris
    @activities = [
        { :actor => 'Tyler Landry',
          :image => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => 'Sept 3, 2011'
      },
      { :actor => 'Tyler Landry',
          :image => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => 'Sept 3, 2011'
      },
      { :actor => 'Tyler Landry',
          :image => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => 'Sept 3, 2011'
      },
      { :actor => 'Tyler Landry',
          :image => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => 'Sept 3, 2011'
      },
      { :actor => 'Tyler Landry',
          :image => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => 'Sept 3, 2011'
      }
    ]
    render 'crout'
  end

  def hiccup
    render 'crout'
  end

end