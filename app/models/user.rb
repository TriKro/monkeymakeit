class User < ActiveRecord::Base
  validates_presence_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,}$/i

  has_many :authentications, :dependent => :destroy
  has_many :creatives, :dependent => :nullify
  has_many :stories, :foreign_key => "author_id", :dependent => :nullify
  has_many :chapters, :through => :stories
  has_many :subscriptions, :dependent => :delete_all
  has_many :subscribed_stories, :through => :subscriptions, :source => :story
  has_many :invites, :dependent => :nullify
  has_many :invitees, :class_name => "User", :foreign_key => "inviter_id", :dependent => :nullify
  belongs_to :inviter, :class_name => "User"
  has_friendly_id :slug_name, :use_slug => true

  def first_name
    full_name.sub(/ .*/, '') rescue ''
  end

  def email_header
    "\"#{full_name}\" <#{email}>"
  end

  def subscribed?(story)
    !subscribed_stories.find_by_id(story.id).nil?
  end

  def name_or_email
    full_name.blank? ? email : full_name
  end

  def email_or_name
    email.blank? ? full_name : email
  end

  def identifier
    return full_name if !full_name.blank?
    return email if !email.blank?
    id
  end

  def slug_name
    full_name.blank? ? 'Anonymous' : full_name
  end

  def self.create_from_hash!(hash)
    info = hash['user_info']
    users_name = info['name']
    image = info['image'] if !info['image'].blank?
    if hash['provider'] == 'facebook'
      email = hash['extra']['user_hash']['email']
    else
      email = nil
    end
    user = new( :full_name => users_name, :image => image, :email => email )
    user.save( false )
    user
  end

  def self.find_or_create_from_email_and_attributes(email, *attributes)
    user = User.find_by_email(email)
    return user if user
    user = User.create(:email => email)
    attributes.each do |attribute|
      user.update_attributes(attribute)
    end
    user
  end

end
