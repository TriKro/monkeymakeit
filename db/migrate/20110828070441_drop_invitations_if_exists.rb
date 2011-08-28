class DropInvitationsIfExists < ActiveRecord::Migration
  def self.up
    drop_table :invitations if table_exists?("invitations")
  end

  def self.down
  end
end
