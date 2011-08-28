require 'image_size'

## create new buttons, or update existing if changed
#button_paths = Dir[ Rails.root.join( *%w[ public images widget_buttons * ] ) ]
#button_paths.each do |button_path|
#  button_name = button_path.split('/').last
#  invitation = Button.where(:button_name => button_name).first || Button.new(:button_name => button_name)
#  image_width, image_height = open(button_path, 'rb') { |button_file| ImageSize.new(button_file.read).get_size }
#  invitation.button_width  = image_width
#  invitation.button_height = image_height / 2   # This assumes all images are sprites, with rollover image stacked below the normal state
#  invitation.save!
#end
#
## delete invitations for buttons that have been removed
#button_names = button_paths.map{|button_path| button_path.split('/').last }
#Button.where("button_name NOT IN (?)", button_names).destroy_all

ActiveRecord::Observer.disable_observers

user = User.find_or_create_by_email(:email => "accounts@tristankromer.com")
user.update_attributes(:full_name => "Tristan Kromer",
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
user.update_attributes(:full_name => "Kartik Agaram",
                       :image => "http://a2.twimg.com/profile_images/42109872/akkartik-sq_normal.JPG",
                       :access => "admin")

auth = Authentication.find_or_create_by_token(:token => "169349883130377|66d29be0c659fe1fb3226606.1-7951553|7V4bTUXbTdy1jq7SFVBhQNrULjQ")
auth.update_attributes(:uid => "7951553",
                       :provider => "facebook",
                       :user_id => user.id)

user = User.find_or_create_by_email(:email => "scott@omnibucket.com")
user.update_attributes(:full_name => "Scott Lambridis",
                       :image => "/images/avatars/image-scott-lambridis.png",
                       :bio => "My stories have appeared in Storyglossia, the UK's Black Static, and Transfer Magazine. Born and raised in New York, I earned a degree in neurobiology from UVa - which I promptly abandoned for a creative career. I'm completing my MFA at San Francisco State, and working on a book about the scientist who discovered the end of time.",
                       :access => "admin")

auth = Authentication.find_or_create_by_token(:token => "169349883130377|dd0dec9c68aec02ea07d38b7.1-713411825|XuASGELymbbvxAC01zyIzQmixSM")
auth.update_attributes(:uid => "713411825",
                       :provider => "facebook",
                       :user_id => user.id)

story = Story.find_or_create_by_title(:title => "Oh, Mighty Hiccup!",
                                      :subtitle => "a novel about brothers, hiccups, and the end of time")

user.stories << story

story = Story.find_or_create_by_title(:title => "Doris",
                                      :subtitle => "a short story about an albino duck")

user.stories << story

story = Story.find_or_create_by_title(:title => "Life of the Gallows",
                                      :subtitle => "a short story about a medieval jester-turned-executioner")

user.stories << story