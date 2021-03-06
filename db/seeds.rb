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

lauren = User.find_or_create_by_email(:email => "laurenguza@gmail.com")
lauren.update_attributes(:name => "Lauren Guza",
                         :image => "/images/avatars/image-lauren_guza.jpg",
                         :bio => "I grew up in the foothills just outside Los Angeles, graduated from Middlebury College with a degree in English and creative writing, and then spent several years working in inner-city schools with the Teach for America, 826 Valencia, and KIPP organizations. I'm now completing work on an MFA at San Francisco State. My writing has been published in Colorado Review, Spain from a Backpack, Hunger and Thirst, and LA Inside.",
                       :access => "reader")

dayna = User.find_or_create_by_email(:email => "dayna_ingram@yahoo.com")
dayna.update_attributes(:name => "Dayna Ingram",
                       :image => "/images/avatars/image-dayna-ingram.jpg",
                       :bio => "Dayna Ingram is a student and writer living and working in the Bay Area. Her short stories have appeared in Livermore Street and Collective Fallout. Her first zombie novel, <em>&ldquo;Eat Your Heart Out&rdquo;</em>, will be released this November from BrazenHead, an imprint of Lethe Press. Find out more at <a href='http://thedingram.blogspot.com'>thedingram.blogspot.com</a>.",
                       :access => "reader")

Chapter.destroy_all
Creative.destroy_all
YAML::load(File.open("#{Rails.root}/public/chapters/index.yml")).each do |story|
  story['user'] = User.find_by_email(story['author'])
  story.delete 'author'
  story['chapters'] = story['chapters'].collect do |chapter|
    chapter['creatives'] = chapter['creatives'].collect{|c| Creative.create c}
    Chapter.create(chapter)
  end
  Story.find_or_create_by_title(story['title']).update_attributes(story)
end

# hacky automation for doris
doris = Story.find('doris')
(2..20).each do |chapter_index|
  chapter = Chapter.create :chapter_index => chapter_index, :story => doris
  chapter.creatives << Creative.create(:creative_type => 'image', :filename => 'image-doris.jpg')
  chapter.creatives << Creative.create(:creative_type => 'text', :filename => "doris_#{chapter_index}.txt")
  chapter.save
end
