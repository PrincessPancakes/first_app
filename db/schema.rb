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

ActiveRecord::Schema.define(:version => 20130223232809) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "brands", ["name"], :name => "index_brands_on_name"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["name", "gender"], :name => "index_categories_on_name_and_gender"
  add_index "categories", ["name"], :name => "index_categories_on_name"

  create_table "measurement_groups", :force => true do |t|
    t.integer  "product_id"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "measurement_groups", ["product_id"], :name => "index_measurement_groups_on_product_id"

  create_table "measurements", :force => true do |t|
    t.integer  "admin_user_id"
    t.string   "status"
    t.integer  "position"
    t.string   "type"
    t.decimal  "waist"
    t.decimal  "front_rise"
    t.decimal  "back_rise"
    t.decimal  "hips"
    t.decimal  "opening"
    t.decimal  "thigh"
    t.decimal  "knee"
    t.decimal  "cuff"
    t.decimal  "inseam"
    t.decimal  "outseam"
    t.decimal  "collar"
    t.decimal  "chest"
    t.decimal  "hps_length"
    t.decimal  "cb_length"
    t.decimal  "shoulder"
    t.decimal  "sleeve_length"
    t.decimal  "arm_hole"
    t.decimal  "sleeve_width"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "measurement_group_id"
    t.integer  "size_id"
    t.string   "size"
  end

  add_index "measurements", ["admin_user_id"], :name => "index_measurements_on_admin_user_id"
  add_index "measurements", ["measurement_group_id"], :name => "index_measurements_on_measurement_group_id"
  add_index "measurements", ["size_id"], :name => "index_measurements_on_size_id"

  create_table "products", :force => true do |t|
    t.integer  "brand_id"
    t.integer  "category_id"
    t.string   "gender"
    t.string   "identifier"
    t.string   "name"
    t.string   "url"
    t.string   "material"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "sizes"
    t.string   "size_type"
    t.string   "tags"
  end

  add_index "products", ["brand_id"], :name => "index_products_on_brand_id"
  add_index "products", ["category_id"], :name => "index_products_on_category_id"

  create_table "sequence_flags", :force => true do |t|
    t.integer  "measurement_group_id"
    t.string   "point"
    t.integer  "size_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "sequence_flags", ["measurement_group_id"], :name => "index_sequence_flags_on_measurement_group_id"
  add_index "sequence_flags", ["size_id"], :name => "index_sequence_flags_on_size_id"

  create_table "size_types", :force => true do |t|
    t.string   "name"
    t.string   "options"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sizes", :force => true do |t|
    t.integer  "size_type_id"
    t.string   "value"
    t.integer  "position"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "sizes", ["size_type_id"], :name => "index_sizes_on_size_type_id"

  create_table "styles", :force => true do |t|
    t.integer  "product_id"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image_url"
  end

  add_index "styles", ["product_id"], :name => "index_styles_on_product_id"

  create_table "verification_flags", :force => true do |t|
    t.integer  "measurement_id"
    t.string   "point"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "verification_flags", ["measurement_id"], :name => "index_verification_flags_on_measurement_id"

end
