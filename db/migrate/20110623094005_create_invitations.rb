class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.integer  :widget_id
      t.string :button_name
      t.text :call_to_action
      t.text :confirmation
      t.timestamps
    end
  end

  def self.down
  end
end
