class Ability
  #include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    # all access
    if user.access == "admin"
      can :manage, :all

    # Members can create resources and tags,
    # update their own resources,
    # manage their own reviews,
    # but may not destroy resources or tags
    #elsif user.access == "member"
    #  can :manage, :profile
    end

    # Abilities for all users:
    # TODO: Decide on general approach to access control. Implement permissions here.
    can [:create, :update], Activity
    can :create, UserSession
    can :create, User
    can [:manage], User, :user_id => current_user.id
    can [:create, :update], Authentication
    can :create, ContactMessage

  end

end
