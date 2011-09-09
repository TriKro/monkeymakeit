class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.access == "reader" || user.access == "author"
      can [:add_email, :update_email], User, :id => user.id
      can [:update, :destroy], User, :id => user.id
      can :destroy, Authentication, :user_id => user.id
      can [:read, :send_invites], Invite, :user_id => user.id
      can [:create, :destroy], Subscription, :user_id => user.id
    end

    if user.access == "author"
      can :manage, User, :user_id => user.id
      can [:update, :destroy], Story, :user_id => user.id
      can :create, Story
      can [:update, :destroy], Chapter, :story => { :user_id => user.id }
      can :create, Chapter, :story => { :user_id => user.id }
      can [:update, :destroy], Creative, :user_id => user.id
      can :create, Creative
    end

    if user.access == "admin"
      can :manage, :all
    end

    can :read, Story
    can :index, Chapter
    if RAILS_ENV == 'production'
      can :show, Chapter, Chapter do |chapter|
        !chapter.publishing_date.nil? && chapter.publishing_date <= Time.now
      end
    else
      can :show, Chapter
    end
    can :read, Creative
    can :show, User
    can :create, ContactMessage

  end

end
