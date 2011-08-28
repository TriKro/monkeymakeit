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

user = User.find_or_create_by_email(:full_name => "Tristan Kromer",
                             :email => "accounts@tristankromer.com",
                             :avatar_remote_url => "http://a2.twimg.com/profile_images/1092489881/24208_1328078796346_1062228442_1001804_2392997_n_normal.jpg",
                             :access => "admin")

Authentication.find_or_create_by_token(:token => "169349883130377|afbafe5fc656fd73cd682a0f.1-1062228442|nOnsUDtKq2RHHL01ocsuCrkGlwk",
                                       :secret => "vx3Dfq5RtYgU4sYlQqizWzk227zhdF5114hrJ8Ct18",
                                       :uid => "31536253",
                                       :provider => "twitter",
                                       :user_id => user.id)

Authentication.find_or_create_by_token(:token => "31536253-CaPDpW9iV3HdLZV1HIRC25JS3MMDYXxdx1XVYZOr1",
                                       :uid => "1062228442",
                                       :provider => "facebook",
                                       :user_id => user.id)

user = User.find_or_create_by_email(:full_name => "Kartik Agaram",
                             :email => "twitter@akkartik.com",
                             :avatar_remote_url => "http://a2.twimg.com/profile_images/42109872/akkartik-sq_normal.JPG",
                             :access => "admin")

Authentication.find_or_create_by_token(:token => "169349883130377|66d29be0c659fe1fb3226606.1-7951553|7V4bTUXbTdy1jq7SFVBhQNrULjQ",
                                       :uid => "7951553",
                                       :provider => "facebook",
                                       :user_id => user.id)