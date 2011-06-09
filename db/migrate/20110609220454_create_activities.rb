class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer  :user_id
      t.string   :activity_type
      t.string   :data
      t.integer  :target_id
      t.string   :target_type
      t.integer  :subtarget_id
      t.string   :subtarget_type
      t.string   :url
      t.string   :target_model
      t.string   :subtarget_model
      t.string   :session_id

      t.timestamps
    end

    add_index :activities, [:target_id, :target_type]
    add_index :activities, [:subtarget_id, :subtarget_type]
    add_index :activities, :user_id

  end

  def self.down
    drop_table :activities
  end
end
