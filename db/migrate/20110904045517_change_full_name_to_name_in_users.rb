class ChangeFullNameToNameInUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :full_name, :name
  end

  def self.down
    rename_column :users, :name, :full_name
  end
end
