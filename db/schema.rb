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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151001015344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.integer  "user_id"
    t.string   "building_number",    null: false
    t.string   "apt_or_unit_number"
    t.string   "street",             null: false
    t.string   "city",               null: false
    t.string   "state",              null: false
    t.string   "zip_code",           null: false
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "base_models", force: true do |t|
    t.decimal  "price",       precision: 5, scale: 2
    t.text     "description"
    t.string   "class_name"
    t.string   "name"
    t.string   "type"
    t.string   "image_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "base_models_specifications", force: true do |t|
    t.integer "base_model_id",    null: false
    t.integer "specification_id", null: false
  end

  add_index "base_models_specifications", ["base_model_id"], name: "index_base_models_specifications_on_base_model_id", using: :btree
  add_index "base_models_specifications", ["specification_id"], name: "index_base_models_specifications_on_specification_id", using: :btree

  create_table "options", force: true do |t|
    t.decimal  "price",         precision: 5, scale: 2, default: 0.0
    t.integer  "base_model_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "shopping_cart_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "shopping_cart_id"
    t.integer  "quantity"
    t.integer  "base_model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["base_model_id"], name: "index_products_on_base_model_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "selected_product_options", force: true do |t|
    t.integer "product_id", null: false
    t.integer "option_id",  null: false
  end

  add_index "selected_product_options", ["option_id"], name: "index_selected_product_options_on_option_id", using: :btree
  add_index "selected_product_options", ["product_id"], name: "index_selected_product_options_on_product_id", using: :btree

  create_table "shopping_carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "specifications", force: true do |t|
    t.integer  "base_model_id"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "status",      default: "new", null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "email",                               null: false
    t.string   "phone_number"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
