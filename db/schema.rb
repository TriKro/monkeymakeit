# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110706185409) do

  create_table "activities", :force => true do |t|
    t.integer   "user_id"
    t.string    "activity_type"
    t.string    "data"
    t.integer   "target_id"
    t.string    "target_type"
    t.integer   "subtarget_id"
    t.string    "subtarget_type"
    t.string    "url"
    t.string    "target_model"
    t.string    "subtarget_model"
    t.string    "session_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "activities", ["subtarget_id", "subtarget_type"], :name => "index_activities_on_subtarget_id_and_subtarget_type"
  add_index "activities", ["target_id", "target_type"], :name => "index_activities_on_target_id_and_target_type"
  add_index "activities", ["user_id"], :name => "index_activities_on_user_id"

  create_table "authentications", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitations", :force => true do |t|
    t.integer   "widget_id"
    t.string    "button_name"
    t.text      "call_to_action"
    t.text      "confirmation"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "button_width"
    t.integer   "button_height"
  end

  create_table "suggestions", :force => true do |t|
    t.string    "email"
    t.string    "data"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.text      "before_text"
    t.text      "after_text"
    t.text      "before_html"
    t.string    "url"
    t.boolean   "subscribed"
  end

  create_table "users", :force => true do |t|
    t.string    "email"
    t.string    "random_key"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "inviter_id"
    t.string    "full_name"
    t.string    "avatar_remote_url"
  end

  create_table "widgets", :force => true do |t|
    t.integer   "user_id"
    t.string    "random_key"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

end
