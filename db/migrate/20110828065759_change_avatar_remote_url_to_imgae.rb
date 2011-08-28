class ChangeAvatarRemoteUrlToImgae < ActiveRecord::Migration
  def self.up
    rename_column :users, :avatar_remote_url, :image
  end

  def self.down
    rename_column :users, :image, :avatar_remote_url
  end
end
