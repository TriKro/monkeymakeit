class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    # all access
    if user.access == "reader"
      can :manage, User, :user_id => user.id
      can :update, Authentication, :user_id => user.id
      can :read, Invite, :user_id => user.id
      can :send_invites, Invite, :user_id => user.id
    elsif user.access == "author"
      can :manage, User, :user_id => user.id
      can :update, Authentication, :user_id => user.id
      can :manage, Story, :user_id => user.id
      can :create, Story
    elsif user.access == "admin"
      can :manage, :all
    end

    # Abilities for all users:
    can :create, ContactMessage
    can :read, Story
    can :referral_redirect, Story
  end

end
