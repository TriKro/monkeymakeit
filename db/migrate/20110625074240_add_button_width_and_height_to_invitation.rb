class AddButtonWidthAndHeightToInvitation < ActiveRecord::Migration
  def self.up
    add_column :invitations, :button_width, :integer
    add_column :invitations, :button_height, :integer
  end

  def self.down
    remove_column :invitations, :button_height
    remove_column :invitations, :button_width
  end
end
