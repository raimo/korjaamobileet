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

ActiveRecord::Schema.define(:version => 20101017135831) do

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.string   "teller"
    t.integer  "joke_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["joke_id"], :name => "index_comments_on_joke_id"

  create_table "hot_links", :force => true do |t|
    t.string   "url",        :default => "http://", :null => false
    t.integer  "clicked",    :default => 0
    t.integer  "position",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.boolean  "approved",   :default => false,     :null => false
  end

  create_table "jokes", :force => true do |t|
    t.text     "body"
    t.integer  "points",     :default => 0, :null => false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "teller"
  end

  create_table "news_items", :force => true do |t|
    t.string   "title"
    t.date     "when"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",   :default => false, :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "votes", :force => true do |t|
    t.string   "ip"
    t.integer  "joke_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
