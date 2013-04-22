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

ActiveRecord::Schema.define(:version => 20130422122556) do

  create_table "active_admin_comments", :force => true do |t|
    t.string    "resource_id",   :null => false
    t.string    "resource_type", :null => false
    t.integer   "author_id"
    t.string    "author_type"
    t.text      "body"
    t.timestamp "created_at",    :null => false
    t.timestamp "updated_at",    :null => false
    t.string    "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string    "email",                  :default => "", :null => false
    t.string    "encrypted_password",     :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",          :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at",                             :null => false
    t.timestamp "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "attached_images", :force => true do |t|
    t.timestamp "created_at",                            :null => false
    t.timestamp "updated_at",                            :null => false
    t.string    "image_file_name"
    t.string    "image_content_type"
    t.integer   "image_file_size"
    t.timestamp "image_updated_at"
    t.integer   "product_id"
    t.boolean   "replica",            :default => false
  end

  create_table "designers", :force => true do |t|
    t.string    "name"
    t.string    "alias"
    t.integer   "order"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.string    "name"
    t.string    "email"
    t.string    "phone"
    t.integer   "product_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at",                    :null => false
    t.timestamp "updated_at",                    :null => false
    t.decimal   "price",        :default => 0.0
    t.string    "code"
    t.integer   "type_id"
    t.integer   "style_id"
    t.integer   "designer_id"
    t.text      "description"
    t.integer   "selection_id"
  end

  create_table "selections", :force => true do |t|
    t.string   "name"
    t.string   "alias"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "styles", :force => true do |t|
    t.string    "name"
    t.string    "alias"
    t.integer   "order"
    t.timestamp "created_at",         :null => false
    t.timestamp "updated_at",         :null => false
    t.string    "image_file_name"
    t.string    "image_content_type"
    t.integer   "image_file_size"
    t.timestamp "image_updated_at"
  end

  create_table "types", :force => true do |t|
    t.string    "name"
    t.string    "alias"
    t.integer   "order"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
    t.string    "productname"
  end

end
