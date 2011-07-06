require_dependency File.dirname(__FILE__) + '/../../lib/random_key'

require 'cgi'

class User < ActiveRecord::Base

  include RandomKey

  has_many :authentications
  has_many :widgets
  has_many :activities, :as => :target
  has_many :activities, :as => :subtarget

  belongs_to :inviter, :class_name => 'User'

  #validates_uniqueness_of :email
  #validates_presence_of :email
  #validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,}$/i

  def first_name
    full_name.sub(/ .*/, '') rescue ''
  end

  def email_header
    "\"#{full_name}\" <#{email}>"
  end

  def identifier
    full_name.blank? ? email : full_name
  end

  def self.owning(url)
    return "DEMO" if url.include?("demo=true")
    User.find_by_random_key(CGI.parse(url.split('?')[1])['code'][0]).identifier rescue url
  end

  def self.create_from_hash!(hash)

    info = hash['user_info']

    if hash['provider'] == 'linked_in'
      users_name = [info['first_name'],info['last_name']].join(' ')
    else
      users_name = info['name']
    end

    if info['image'] != ""
      image = info['image']
    else
      image = nil
    end

    create( :full_name => users_name, :avatar_remote_url => image )

  end


end
