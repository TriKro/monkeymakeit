class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    # all access
    if user.access == "admin"
      can :manage, :all

    elsif user.access == "member"
      can :manage, User, :user_id => user.id
    end

    # Abilities for all users:
    can [:create, :update], Authentication
    can :create, ContactMessage
  end

end
