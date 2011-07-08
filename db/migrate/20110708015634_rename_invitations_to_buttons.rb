class RenameInvitationsToButtons < ActiveRecord::Migration
  def self.up
    rename_table :invitations, :buttons
  end

  def self.down
    rename_table :buttons, :invitations
  end
end
