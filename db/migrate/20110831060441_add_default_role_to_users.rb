class AddDefaultRoleToUsers < ActiveRecord::Migration
  def self.up
    change_column_default(:users, :access, "reader")
    User.all.each do |user|
      user.update_attribute(:access, "reader") if user.access == nil
    end
  end

  def self.down
    change_column_default(:users, :access, nil)
  end
end
