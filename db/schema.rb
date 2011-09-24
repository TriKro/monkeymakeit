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

ActiveRecord::Schema.define(:version => 20110924231918) do

  create_table "authentications", :force => true do |t|
    t.string    "provider"
    t.string    "uid"
    t.integer   "user_id"
    t.string    "token"
    t.string    "secret"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "chapters", :force => true do |t|
    t.integer   "chapter_index"
    t.integer   "story_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "title"
    t.timestamp "publishing_date"
  end

  create_table "creatives", :force => true do |t|
    t.string    "creative_type"
    t.string    "filename"
    t.string    "title"
    t.string    "creator"
    t.integer   "chapter_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "user_id"
  end

  create_table "invites", :force => true do |t|
    t.integer   "user_id"
    t.integer   "story_id"
    t.string    "code"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "cached_slug"
  end

  add_index "invites", ["cached_slug"], :name => "index_invites_on_cached_slug", :unique => true
  add_index "invites", ["code"], :name => "index_invites_on_code", :unique => true

  create_table "referrals", :id => false, :force => true do |t|
    t.integer   "user_id"
    t.integer   "invite_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "slugs", :force => true do |t|
    t.string    "name"
    t.integer   "sluggable_id"
    t.integer   "sequence",                     :default => 1, :null => false
    t.string    "sluggable_type", :limit => 40
    t.string    "scope"
    t.timestamp "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "stories", :force => true do |t|
    t.string    "title"
    t.string    "subtitle"
    t.text      "summary"
    t.integer   "user_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "cached_slug"
  end

  add_index "stories", ["cached_slug"], :name => "index_stories_on_cached_slug", :unique => true

  create_table "subscriptions", :force => true do |t|
    t.integer "user_id"
    t.integer "story_id"
  end

  create_table "users", :force => true do |t|
    t.string    "email"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "name"
    t.string    "image"
    t.string    "access",      :default => "reader"
    t.text      "bio"
    t.string    "cached_slug"
  end

  add_index "users", ["cached_slug"], :name => "index_users_on_cached_slug", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email"

end
