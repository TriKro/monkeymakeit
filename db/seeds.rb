ActiveRecord::Observer.disable_observers

user = User.find_or_create_by_email(:email => "accounts@tristankromer.com")
user.update_attributes(:name => "Tristan Kromer",
                       :image => "http://a2.twimg.com/profile_images/1092489881/24208_1328078796346_1062228442_1001804_2392997_n_normal.jpg",
                       :access => "admin")

auth = Authentication.find_or_create_by_token(:token => "169349883130377|afbafe5fc656fd73cd682a0f.1-1062228442|nOnsUDtKq2RHHL01ocsuCrkGlwk")
auth.update_attributes(:secret => "vx3Dfq5RtYgU4sYlQqizWzk227zhdF5114hrJ8Ct18",
                       :uid => "31536253",
                       :provider => "twitter",
                       :user_id => user.id)

auth = Authentication.find_or_create_by_token(:token => "31536253-CaPDpW9iV3HdLZV1HIRC25JS3MMDYXxdx1XVYZOr1")
auth.update_attributes(:uid => "1062228442",
                       :provider => "facebook",
                       :user_id => user.id)

user = User.find_or_create_by_email(:email => "twitter@akkartik.com")
user.update_attributes(:name => "Kartik Agaram",
                       :image => "http://a2.twimg.com/profile_images/42109872/akkartik-sq_normal.JPG",
                       :access => "admin")

auth = Authentication.find_or_create_by_token(:token => "169349883130377|66d29be0c659fe1fb3226606.1-7951553|7V4bTUXbTdy1jq7SFVBhQNrULjQ")
auth.update_attributes(:uid => "7951553",
                       :provider => "facebook",
                       :user_id => user.id)

auth = Authentication.find_or_create_by_token(:token => "8707662-doWtYOJxqPjjSKmnuWn9uvx5ngUvZV3VmG408DGHE")
auth.update_attributes(:secret => "dZWY2OE8mfOikjBWW6bAeHKSSsOJl0BGU9qkYE3rImA",
                       :uid => "8707662",
                       :provider => "twitter",
                       :user_id => user.id)

scott = User.find_or_create_by_email(:email => "scott@omnibucket.com")
scott.update_attributes(:name => "Scott Lambridis",
                       :image => "/images/avatars/image-scott-lambridis.png",
                       :bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time.",
                       :access => "admin")

auth = Authentication.find_or_create_by_token(:token => "169349883130377|dd0dec9c68aec02ea07d38b7.1-713411825|XuASGELymbbvxAC01zyIzQmixSM")
auth.update_attributes(:uid => "713411825",
                       :provider => "facebook",
                       :user_id => scott.id)

Chapter.destroy_all
Creative.destroy_all
YAML::load(File.open("#{Rails.root}/app/views/stories/index.yml")).each do |story|
  story['user'] = User.find_by_email(story['author'])
  story.delete 'author'
  story['chapters'] = story['chapters'].collect do |chapter|
    chapter['creatives'] = chapter['creatives'].collect{|c| Creative.create c}
    Chapter.create(chapter)
  end
  Story.find_or_create_by_title(story['title']).update_attributes(story)
end
