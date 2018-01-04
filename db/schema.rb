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

ActiveRecord::Schema.define(version: 20_151_123_005_640) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', id: :serial, force: :cascade do |t|
    t.integer 'user_id'
    t.string 'building_number', limit: 255, null: false
    t.string 'apt_or_unit_number', limit: 255
    t.string 'street', limit: 255, null: false
    t.string 'city', limit: 255, null: false
    t.string 'state', limit: 255, null: false
    t.string 'zip_code', limit: 255, null: false
    t.string 'type', limit: 255
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'base_models', id: :serial, force: :cascade do |t|
    t.decimal 'price', precision: 5, scale: 2, null: false
    t.text 'description', null: false
    t.string 'class_name', limit: 255
    t.string 'name', limit: 255, null: false
    t.string 'type', limit: 255
    t.string 'image_path', limit: 255
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'base_models_specifications', id: :serial, force: :cascade do |t|
    t.integer 'base_model_id', null: false
    t.integer 'specification_id', null: false
    t.index ['base_model_id'], name: 'index_base_models_specifications_on_base_model_id'
    t.index ['specification_id'], name: 'index_base_models_specifications_on_specification_id'
  end

  create_table 'options', id: :serial, force: :cascade do |t|
    t.decimal 'price', precision: 5, scale: 2, default: '0.0', null: false
    t.integer 'base_model_id'
    t.text 'description', null: false
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'orders', id: :serial, force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'shopping_cart_id', null: false
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'status_id', null: false
    t.index ['status_id'], name: 'index_orders_on_status_id'
  end

  create_table 'products', id: :serial, force: :cascade do |t|
    t.integer 'shopping_cart_id', null: false
    t.integer 'quantity', null: false
    t.integer 'base_model_id', null: false
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index ['base_model_id'], name: 'index_products_on_base_model_id'
  end

  create_table 'roles', id: :serial, force: :cascade do |t|
    t.string 'name', limit: 255
    t.integer 'resource_id'
    t.string 'resource_type', limit: 255
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index %w(name resource_type resource_id), name: 'index_roles_on_name_and_resource_type_and_resource_id'
    t.index ['name'], name: 'index_roles_on_name'
  end

  create_table 'selected_product_options', id: :serial, force: :cascade do |t|
    t.integer 'product_id', null: false
    t.integer 'option_id', null: false
    t.index ['option_id'], name: 'index_selected_product_options_on_option_id'
    t.index ['product_id'], name: 'index_selected_product_options_on_product_id'
  end

  create_table 'shopping_carts', id: :serial, force: :cascade do |t|
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'user_id'
  end

  create_table 'specifications', id: :serial, force: :cascade do |t|
    t.integer 'base_model_id'
    t.text 'description', null: false
    t.string 'type', limit: 255
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'statuses', id: :serial, force: :cascade do |t|
    t.string 'status', limit: 255, default: 'new', null: false
    t.text 'description'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'users', id: :serial, force: :cascade do |t|
    t.string 'first_name', limit: 255
    t.string 'last_name', limit: 255
    t.string 'title', limit: 255
    t.string 'email', limit: 255, null: false
    t.string 'phone_number', limit: 255
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'encrypted_password', limit: 255, default: '', null: false
    t.string 'reset_password_token', limit: 255
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'users_roles', id: false, force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'role_id'
    t.index %w(user_id role_id), name: 'index_users_roles_on_user_id_and_role_id'
  end
end
