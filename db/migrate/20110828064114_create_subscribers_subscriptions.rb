class CreateSubscribersSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscribers_subscriptions, :id => false do |t|
      t.integer :user_id
      t.integer :story_id
    end
  end

  def self.down
    drop_table :subscribers_subscriptions
  end
end
