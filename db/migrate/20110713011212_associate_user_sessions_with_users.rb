class AssociateUserSessionsWithUsers < ActiveRecord::Migration
  def self.up
    User.all.each do |user|
      activity = Activity.where(:activity_type => "Created", :target_type => "User", :target_id => user.id).first
      if !activity.nil?
        if activity.url != "/invitations" && !activity.session_id.nil?
          user.user_sessions << UserSession.find_by_session_id(activity.session_id)
        end
      end
    end

    #UserSession.all.each do |session|
    #
    #  # If a UserSession has an activity where it created a User on the registrations page, then that User owns all that UserSession and by extension, all associated activities
    #  if (activity = session.activities.where(:activity_type => "Created", :target_type => "User", :url => "/registrations").first).nil?
    #    activity = session.activities.where(:activity_type => "Created", :target_type => "User", :url => "/signups").first
    #  end
    #  if !activity.nil?
    #    User.find(activity.target_id).user_sessions << session
    #  end
    #end
  end

  def self.down
    User.all.each do |user|
      user.user_sessions.delete(user.user_sessions)
    end
  end
end
