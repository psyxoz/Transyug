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

ActiveRecord::Schema.define(:version => 20120524052949) do

  create_table "jobs", :force => true do |t|
    t.string   "title_ru"
    t.string   "title_en"
    t.text     "description_ru"
    t.text     "description_en"
    t.integer  "sort_id",        :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "page_images", :force => true do |t|
    t.integer  "page_id"
    t.string   "file"
    t.string   "alias"
    t.integer  "sort_id",    :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "page_options", :force => true do |t|
    t.integer  "page_id"
    t.integer  "parent_id"
    t.string   "title"
    t.text     "content"
    t.string   "locale",     :default => "ru"
    t.integer  "sort_id",    :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "code"
    t.string   "title_ru"
    t.string   "title_en"
    t.text     "description_ru"
    t.text     "description_en"
    t.text     "content_ru"
    t.text     "content_en"
    t.text     "extra"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "pages", ["code"], :name => "index_pages_on_code", :unique => true

  create_table "partners", :force => true do |t|
    t.string   "title_ru"
    t.string   "title_en"
    t.string   "link"
    t.integer  "sort_id",    :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",       :null => false
    t.string   "encrypted_password",     :default => "",       :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role",                   :default => "nobody"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vessel_images", :force => true do |t|
    t.integer  "vessel_id"
    t.string   "file"
    t.integer  "sort_id",    :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "vessels", :force => true do |t|
    t.string   "title_ru"
    t.string   "title_en"
    t.text     "description_ru"
    t.text     "description_en"
    t.text     "content_ru"
    t.text     "content_en"
    t.text     "location"
    t.string   "pocket_plan"
    t.boolean  "archive",             :default => false
    t.boolean  "featured",            :default => false
    t.integer  "sort_id",             :default => 0
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.text     "full_description_ru"
    t.text     "full_description_en"
  end

end
