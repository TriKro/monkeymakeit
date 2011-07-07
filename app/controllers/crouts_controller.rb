class CroutsController < ApplicationController

  before_filter lambda {
    log_activity(request.request_uri, "Viewed", "Page")
  }

  def doris
    @crout = {
        :title => "Doris",
        :subtitle => "a short story about an albino duck",
        :author => "Scott Lambridis",
        :author_avatar => "images/image-scott-lambridis.png",
        :author_bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time. You know, the usual.",
        :first_letter => "W",
        :first_para => "hat happened next was simple: O'Malley saw a duck, and the sight of that duck was accompanied by a sense of familiarity beyond the common familiarity with duck-like forms. He could not place why he had that feeling but, being trained in consumer awareness and acutely tuned to the intricacies of perception, O'Malley surmised the true cause of the accident. Moments ago, inside the trolley, in the periphery of his consciousness and beyond his recognition, an image had formed of this sort of duck, a model for automation from wings to webbings, a white sort of duck whose everything that should have been yellow was instead a pale pink like a young farm girl's arms in the wind, and had he been interviewed the following day for the morning edition, O'Malley would have sworn that he saw the duck right there on the tracks, begging calamity, even before he heard the trolley wheels squelch and the packed passengers scream and the head push through the glass, and now there was the duck again outside the trolley, sitting right on the tracks behind the trolley though the trolley had detached itself from its grooves, and O'Malley, rather than addressing the forms and noises and confusion behind him, scooped the duck up into his arms and walked away.",
        :second_para => "Before I continue...",
        :artwork => "images/image-doris.jpg",
        :artwork_title => "Doris",
        :artist => "Tyler Landry"
    }
    @activities = [
        { :actor => 'Scott Lambridis',
            :actor_avatar => 'images/image-scott-lambridis.png',
            :verb => 'edited the ',
            :object => 'text',
            :details => '"Killed some bad scenes, did some general editing for cadence and flow.."',
            :timestamp => '18 minutes ago'
        },
        { :actor => 'Savanah Rose',
            :actor_avatar => 'images/image-scott-lambridis.png',
            :verb => 'said',
            :object => '',
            :details => '"I love the new picture! It fits perfectly."',
            :timestamp => '4 hours ago'
        },
        { :actor => 'Tyler Landry',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => '12 hours ago'
        },
        { :actor => 'Alex Q Huffman',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'updated a',
          :object => 'song',
          :details => '"Fixed the bassline."',
          :timestamp => 'Yesterday at 8:12pm'
        },
        { :actor => 'Tristan Kromer',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'created a ',
          :object => 'branch',
          :details => '"Started a new story based on the Jane character.',
          :timestamp => 'Yesterday at 1:01pm'
        }
    ]
    render 'crout'
  end

  def hiccup
        @crout = {
        :title => "Oh, Mighty Hiccup!",
        :subtitle => "about brothers, hiccups, and the end of time",
        :author => "Scott Lambridis",
        :author_avatar => "images/image-scott-lambridis.png",
        :author_bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time. You know, the usual.",
        :first_letter => "T",
        :first_para => "he jester pranced onstage, the seamstress sewed the dresses, the children danced in the dirt, the musicians played the songs, the beggars begged for alms, the executioner kicked the stools, the gravedigger dug the graves, and the gallows bird rose with the snap and landed again.",
        :second_para => "They argued, the jester's son and daughter, their arms in the air and their mouths wide, until she gave in and walked with him to the gallows and helped reclaim their father's costume from his hanging body, a mountain of torn fabric covered in rotting fruit matter, infested with maggots, and stained by excrement and dried saliva. Dogs, she said, indicating the fabric's leg that had been torn away. A crow watched from the top of the pole as they walked the costume home. She helped him clean off the smell, trying not to vomit but often failing, washing their father away until the costume was clean and snug, and the jester's son became the jester.",
        :third_para => "He collected coins in a bucket performing in the street. She sewed dresses for other poor folk, and they ate little. She had a cough and stayed in bed the day the castle announced a competition for the next court jester, so he went alone. At the entrance, he saw a never-ending sea of entertainers, poets, musicians, clowns, jugglers, and magicians in countless colors lined up along the grassy hill, waiting to enter the castle gate. They held each other's shoulders, swinging mugs of beer and singing songs. The sun dimmed, the moon snarled, and the castle wall towered. Everyone's skin turned gray, and the day the castle announced a competition for the next court jester, so he went alone. At the entrance, he saw a never-ending sea of entertainers, poets, musicians, clowns, jugglers, and magicians in countless colors lined up along the grassy hill, waiting to enter the castle gate. They held each other&#39;s shoulders, swinging mugs of beer and singing songs. The sun dimmed, the moon snarled, and the castle wall towered.",
        :fourth_para => "Everyone's skin turned gray, and the camaraderie splintered. Musicians pushed acrobats, poets kicked and bit the magicians, and jugglers threw everything they could find. The gate opened as he approached and he walked through candle-lit corridors into a small, dark room. Egged on by shadows and whispers, he danced and sang for the phantom king hidden in a lightless corner of the room. I do not have one job for you, the king said, but two.",
        :artwork => "images/image-jester.jpg",
        :artwork_title => "Jester",
        :artist => "Tyler Landry"
    }
    @activities = [
        { :actor => 'Tyler Landry',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => 'Sept 3, 2011'
      },
      { :actor => 'Tyler Landry',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => 'Sept 3, 2011'
      },
      { :actor => 'Tyler Landry',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => 'Sept 3, 2011'
      },
      { :actor => 'Tyler Landry',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => 'Sept 3, 2011'
      },
      { :actor => 'Tyler Landry',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => 'Sept 3, 2011'
      }
    ]
    render 'crout'
  end

    def doris2
    @crout = {
        :title => "Doris",
        :subtitle => "a short story about an albino duck",
        :author => "Scott Lambridis",
        :author_avatar => "images/image-scott-lambridis.png",
        :author_bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time. You know, the usual.",
        :first_letter => "W",
        :first_para => "hat happened next was simple: O'Malley saw a duck, and the sight of that duck was accompanied by a sense of familiarity beyond the common familiarity with duck-like forms. He could not place why he had that feeling but, being trained in consumer awareness and acutely tuned to the intricacies of perception, O'Malley surmised the true cause of the accident. Moments ago, inside the trolley, in the periphery of his consciousness and beyond his recognition, an image had formed of this sort of duck, a model for automation from wings to webbings, a white sort of duck whose everything that should have been yellow was instead a pale pink like a young farm girl's arms in the wind, and had he been interviewed the following day for the morning edition, O'Malley would have sworn that he saw the duck right there on the tracks, begging calamity, even before he heard the trolley wheels squelch and the packed passengers scream and the head push through the glass, and now there was the duck again outside the trolley, sitting right on the tracks behind the trolley though the trolley had detached itself from its grooves, and O'Malley, rather than addressing the forms and noises and confusion behind him, scooped the duck up into his arms and walked away.",
        :second_para => "Before I continue...",
        :artwork => "images/image-doris.jpg",
        :artwork_title => "Doris",
        :artist => "Tyler Landry"
    }
    @activities = [
        { :actor => 'Scott Lambridis',
            :actor_avatar => 'images/image-scott-lambridis.png',
            :verb => 'edited the ',
            :object => 'text',
            :details => '"Killed some bad scenes, did some general editing for cadence and flow.."',
            :timestamp => '18 minutes ago'
        },
        { :actor => 'Savanah Rose',
            :actor_avatar => 'images/image-scott-lambridis.png',
            :verb => 'said',
            :object => '',
            :details => '"I love the new picture! It fits perfectly."',
            :timestamp => '4 hours ago'
        },
        { :actor => 'Tyler Landry',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => '12 hours ago'
        },
        { :actor => 'Alex Q Huffman',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'updated a',
          :object => 'song',
          :details => '"Fixed the bassline."',
          :timestamp => 'Yesterday at 8:12pm'
        },
        { :actor => 'Tristan Kromer',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'created a ',
          :object => 'branch',
          :details => '"Started a new story based on the Jane character.',
          :timestamp => 'Yesterday at 1:01pm'
        }
    ]
    render 'crout2'
  end

  def hiccup2
        @crout = {
        :title => "Oh, Mighty Hiccup!",
        :subtitle => "about brothers, hiccups, and the end of time",
        :author => "Scott Lambridis",
        :author_avatar => "images/image-scott-lambridis.png",
        :author_bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time. You know, the usual.",
        :first_letter => "T",
        :first_para => "he jester pranced onstage, the seamstress sewed the dresses, the children danced in the dirt, the musicians played the songs, the beggars begged for alms, the executioner kicked the stools, the gravedigger dug the graves, and the gallows bird rose with the snap and landed again.",
        :second_para => "They argued, the jester's son and daughter, their arms in the air and their mouths wide, until she gave in and walked with him to the gallows and helped reclaim their father's costume from his hanging body, a mountain of torn fabric covered in rotting fruit matter, infested with maggots, and stained by excrement and dried saliva. Dogs, she said, indicating the fabric's leg that had been torn away. A crow watched from the top of the pole as they walked the costume home. She helped him clean off the smell, trying not to vomit but often failing, washing their father away until the costume was clean and snug, and the jester's son became the jester.",
        :third_para => "He collected coins in a bucket performing in the street. She sewed dresses for other poor folk, and they ate little. She had a cough and stayed in bed the day the castle announced a competition for the next court jester, so he went alone. At the entrance, he saw a never-ending sea of entertainers, poets, musicians, clowns, jugglers, and magicians in countless colors lined up along the grassy hill, waiting to enter the castle gate. They held each other's shoulders, swinging mugs of beer and singing songs. The sun dimmed, the moon snarled, and the castle wall towered. Everyone's skin turned gray, and the day the castle announced a competition for the next court jester, so he went alone. At the entrance, he saw a never-ending sea of entertainers, poets, musicians, clowns, jugglers, and magicians in countless colors lined up along the grassy hill, waiting to enter the castle gate. They held each other&#39;s shoulders, swinging mugs of beer and singing songs. The sun dimmed, the moon snarled, and the castle wall towered.",
        :fourth_para => "Everyone's skin turned gray, and the camaraderie splintered. Musicians pushed acrobats, poets kicked and bit the magicians, and jugglers threw everything they could find. The gate opened as he approached and he walked through candle-lit corridors into a small, dark room. Egged on by shadows and whispers, he danced and sang for the phantom king hidden in a lightless corner of the room. I do not have one job for you, the king said, but two.",
        :artwork => "images/image-jester.jpg",
        :artwork_title => "Jester",
        :artist => "Tyler Landry"
    }
    @activities = [
        { :actor => 'Tyler Landry',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => 'Sept 3, 2011'
      },
      { :actor => 'Tyler Landry',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => 'Sept 3, 2011'
      },
      { :actor => 'Tyler Landry',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => 'Sept 3, 2011'
      },
      { :actor => 'Tyler Landry',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => 'Sept 3, 2011'
      },
      { :actor => 'Tyler Landry',
          :actor_avatar => 'images/image-scott-lambridis.png',
          :verb => 'added a',
          :object => 'picture',
          :details => '"Rough sketch of the mourning crows. These really stick in my head."',
          :timestamp => 'Sept 3, 2011'
      }
    ]
    render 'crout2'
  end
end