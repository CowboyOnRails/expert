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

ActiveRecord::Schema.define(:version => 20120222093154) do

  create_table "articles", :force => true do |t|
    t.string   "name",                             :null => false
    t.text     "body"
    t.integer  "position",         :default => 1,  :null => false
    t.string   "addon"
    t.integer  "parent_id",        :default => 1,  :null => false
    t.integer  "metaitem_id",      :default => -1, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "cover_image_uid"
    t.string   "cover_image_name"
    t.string   "slogan"
    t.string   "head"
  end

  add_index "articles", ["addon"], :name => "index_articles_on_addon"
  add_index "articles", ["metaitem_id"], :name => "index_articles_on_metaitem_id"
  add_index "articles", ["parent_id"], :name => "index_articles_on_parent_id"
  add_index "articles", ["position"], :name => "index_articles_on_position"

  create_table "feedbacks", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "title"
    t.text     "message"
    t.text     "spam"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "adress"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "copyright"
    t.string   "sitename"
  end

  create_table "metaitems", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "keywords"
    t.integer  "page_id"
    t.string   "page_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "metaitems", ["page_id"], :name => "index_metaitems_on_page_id"

  create_table "newsposts", :force => true do |t|
    t.string   "name",                       :null => false
    t.text     "body"
    t.date     "posted"
    t.integer  "metaitem_id", :default => 1, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "newsposts", ["metaitem_id"], :name => "index_newsposts_on_metaitem_id"
  add_index "newsposts", ["posted"], :name => "index_newsposts_on_posted"

  create_table "partners", :force => true do |t|
    t.text     "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "cover_image_uid"
    t.string   "cover_image_name"
  end

  create_table "questions", :force => true do |t|
    t.text     "subject"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
