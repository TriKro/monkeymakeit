class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

#    # all access
#    if user.access == "admin"
#      can :manage, :all
#      can :use, :dashboard
#
#    # Members can create resources and tags,
#    # update their own resources,
#    # manage their own reviews,
#    # but may not destroy resources or tags
#    elsif user.access == "member"
#      can :manage, :profile
#    end

    # Abilities for all users:
    can :manage, :static
    can :manage, :landing_page
    can :manage, :signup
    can :manage, :scripts
    can :manage, :invitations
    can :create, Suggestion
    can :create, Activity
    can :create, ContactMessage

  end

end
