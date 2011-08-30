class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    # all access
    if user.access == "admin"
      can :manage, :all

    elsif user.access == "author"
      can :manage, User, :user_id => user.id
      can :update, Authentication, :user_id => user.id
      can :manage, Story, :user_id => user.id
      can :create, Story
    end

    # Abilities for all users:
    can :create, ContactMessage
    can :read, Story
    can :referral_redirect, Story
  end

end
