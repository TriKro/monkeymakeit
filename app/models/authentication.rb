class Authentication < ActiveRecord::Base
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  belongs_to :user

  def self.find_or_create_from_hash(hash, user=nil)
    auth = Authentication.find_by_provider_and_uid(hash['provider'], hash['uid'])
    return auth.user if !auth.nil?
    user ||= User.create_from_hash!(hash)
    Authentication.create(:user => user, :uid => hash['uid'], :provider => hash['provider'], :token => hash['credentials']['token'], :secret => hash['credentials']['secret'])
    return user
  end

end
