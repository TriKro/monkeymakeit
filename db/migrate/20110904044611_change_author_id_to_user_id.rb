class ChangeAuthorIdToUserId < ActiveRecord::Migration
  def self.up
    rename_column :stories, :author_id, :user_id
  end

  def self.down
    rename_column :stories, :user_id, :author_id
  end
end
