class AddReferralsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :referrals, :id => false do |t|
      t.integer :user_id
      t.integer :invite_id
      t.timestamps
    end
    remove_column :users, :inviter_id
  end

  def self.down
    drop_table :referrals
    add_column :users, :inviter_id, :integer
  end
end