class AddUserIdToCreatives < ActiveRecord::Migration
  def self.up
    add_column :creatives, :user_id, :integer
  end

  def self.down
    remove_column :creatives, :user_id
  end
end
