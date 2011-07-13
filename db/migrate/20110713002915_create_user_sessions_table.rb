class CreateUserSessionsTable < ActiveRecord::Migration

  def self.up

    # First, create a column as foreign key for user_sessions
    add_column :activities, :user_session_id, :integer

    # Create a table to store unique sessions in
    create_table :user_sessions do |t|
      t.string :session_id
      t.integer :user_id

      t.timestamps
    end

    Activity.all.each do |activity|
      # Ignore all activities without sessions. Can't do anything about those.
      if !activity.session_id.nil?
        # Try and find the UserSession in case it already exists.
        if !(user_session = UserSession.find_by_session_id(activity.session_id) )

          # If can't find a UserSession matching the activity's session_id, create a new UserSession.
          user_session = UserSession.create!(:session_id => activity.session_id)
        end

        # Now you definitely have a UserSession, so associate the activity with that UserSession
        user_session.activities << activity
      end
    end
  end

  def self.down
    drop_table :user_sessions
    remove_column :activities, :user_session_id
  end
end
