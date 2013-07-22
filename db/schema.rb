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

ActiveRecord::Schema.define(:version => 20130715141001) do

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

  create_table "cartons", :force => true do |t|
    t.integer  "packing_run_id"
    t.string   "barcode"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "verified"
  end

  create_table "invoice_lines", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "invoice_id"
    t.integer  "product_id"
    t.integer  "quantity"
  end

  create_table "invoices", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "packing_runs", :force => true do |t|
    t.date     "packing_date"
    t.integer  "product_id"
    t.integer  "production_run_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.date     "best_before"
  end

  create_table "production_run_ingredients", :force => true do |t|
    t.integer "production_run_id"
    t.integer "raw_materials_stock_id"
    t.float   "adjustment_qty"
  end

  create_table "production_runs", :force => true do |t|
    t.date     "production_date"
    t.date     "recommended_best_before"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "name"
    t.integer  "recipe_id"
  end

  create_table "products", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "name"
    t.text     "description"
    t.integer  "recipe_id"
  end

  create_table "raw_materials", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "raw_materials_stocks", :force => true do |t|
    t.integer  "raw_material_id"
    t.integer  "qty"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "batch_code"
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recipes_raw_materials", :force => true do |t|
    t.integer  "recipe_id"
    t.integer  "raw_material_id"
    t.integer  "quantity"
    t.string   "unit"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "shipment_items", :force => true do |t|
    t.integer  "carton_id"
    t.integer  "invoice_line_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
