# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130327165730) do

  create_table "carriers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "housing_preferences", :force => true do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.string   "housing_type"
    t.integer  "neighborhood"
    t.integer  "min_rent"
    t.integer  "max_rent"
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.string   "additional_search_terms"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "listings", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "respond_email"
    t.integer  "bedrooms"
    t.integer  "cost"
    t.integer  "housing_preference_id"
    t.integer  "user_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "mobile"
    t.boolean  "receive_text",    :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "active",          :default => true
    t.datetime "last_search"
    t.string   "remember_token"
    t.text     "autointro"
    t.integer  "carrier_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
