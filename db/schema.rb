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

ActiveRecord::Schema.define(:version => 20110828064114) do

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
    t.integer   "user_session_id"
  end

  add_index "activities", ["subtarget_id", "subtarget_type"], :name => "index_activities_on_subtarget_id_and_subtarget_type"
  add_index "activities", ["target_id", "target_type"], :name => "index_activities_on_target_id_and_target_type"
  add_index "activities", ["user_id"], :name => "index_activities_on_user_id"

  create_table "authentications", :force => true do |t|
    t.string    "provider"
    t.string    "uid"
    t.integer   "user_id"
    t.string    "token"
    t.string    "secret"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "funnels", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitations", :force => true do |t|
    t.integer  "widget_id"
    t.string   "button_name"
    t.text     "call_to_action"
    t.text     "confirmation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "button_width"
    t.integer  "button_height"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "steps", :force => true do |t|
    t.integer  "funnel_id"
    t.string   "name"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "summary"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
  end

  add_index "stories", ["cached_slug"], :name => "index_stories_on_cached_slug", :unique => true

  create_table "subscribers_subscriptions", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "story_id"
  end

  create_table "user_sessions", :force => true do |t|
    t.string    "session_id"
    t.integer   "user_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "email"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "inviter_id"
    t.string    "full_name"
    t.string    "avatar_remote_url"
    t.string    "access"
    t.string    "invite_code"
    t.string    "invited_by"
    t.text      "bio"
    t.string    "cached_slug"
  end

  add_index "users", ["cached_slug"], :name => "index_users_on_cached_slug", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invite_code"], :name => "index_users_on_invite_code", :unique => true

end
