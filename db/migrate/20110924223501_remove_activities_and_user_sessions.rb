class RemoveActivitiesAndUserSessions < ActiveRecord::Migration
  def self.up
    remove_index :activities, :column => :user_id if table_exists?("activities")
    remove_index :activities, :column => [:target_id, :target_type] if table_exists?("activities")
    remove_index :activities, :column => [:subtarget_id, :subtarget_type] if table_exists?("activities")
    drop_table :activities if table_exists?("activities")
    drop_table :user_sessions if table_exists?("user_sessions")
  end

  def self.down
  end
end
