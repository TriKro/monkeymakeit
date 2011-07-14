class CreateFunnelsAndStepsTables < ActiveRecord::Migration
  def self.up
    create_table :funnels do |t|
      t.string :name

      t.timestamps
    end
    create_table :steps do |t|
      t.integer :funnel_id
      t.string :name
      t.integer :sequence

      t.timestamps
    end
  end

  def self.down
    drop_table :funnels
    drop_table :steps
  end
end
