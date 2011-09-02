class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    can :create, ContactMessage
    can :read, Story
    can :referral_redirect, Story
    can [:add_email, :update_email], User

    if user.access == "reader" || user.access == "author"
      #can [:add_email, :update_email], User, :id => user.id
      can :show, User
      can [:update, :destroy], User, :id => user.id
      can :update, Authentication, :user_id => user.id
      can [:read, :send_invites], Invite, :user_id => user.id
      can [:create, :destroy], Subscription, :user_id => user.id
    end

    if user.access == "author"
      can :manage, User, :user_id => user.id
      can :update, Authentication, :user_id => user.id
      can :manage, Story, :user_id => user.id
      can :create, Story
    end

    if user.access == "admin"
      can :manage, :all
    end

  end

end
