class Authentication < ActiveRecord::Base
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  belongs_to :user

  def self.find_from_hash(hash)
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end

  def self.create_from_hash(hash, user = nil)
    user ||= User.create_from_hash!(hash)

    # TODO: Re-enable facebook email saving.
    #if hash['provider'] == 'facebook'
    #  email = hash['extra']['user_hash']['email']
    #else
    #  email = nil
    #end
    #email = Email.new(:email => email, :user_id => user.id)
    #email.save(:validate => false)

    # TODO: Set basic access levels.
    # If the user has no access, give member access.
    # This is to prevent overwriting existing access.
    #if !user.access
    #  user.update_attributes(:access => 'member')
    #end

    Authentication.create(:user => user, :uid => hash['uid'], :provider => hash['provider'], :token => hash['credentials']['token'], :secret => hash['credentials']['secret'])
  end

end
