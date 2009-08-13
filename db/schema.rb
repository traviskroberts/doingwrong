# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090813190219) do

  create_table "comments", :force => true do |t|
    t.integer  "entry_id"
    t.string   "name"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "website"
  end

  add_index "comments", ["entry_id"], :name => "index_comments_on_entry_id"

  create_table "entries", :force => true do |t|
    t.integer  "user_id"
    t.string   "to"
    t.text     "message"
    t.boolean  "approved",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.boolean  "has_tweeted", :default => false
  end

  add_index "entries", ["user_id"], :name => "index_entries_on_user_id"

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.boolean  "admin",                                    :default => false
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "entry_id"
    t.boolean  "doing_it_wrong"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["entry_id"], :name => "index_votes_on_entry_id"

end
