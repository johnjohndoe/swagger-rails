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

ActiveRecord::Schema.define(:version => 20121212122829) do

  create_table "apis", :force => true do |t|
    t.integer  "resource_id"
    t.integer  "doc_id"
    t.string   "path"
    t.string   "http_method"
    t.string   "nickname"
    t.string   "response_class"
    t.string   "summary"
    t.string   "note"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "apis", ["doc_id"], :name => "index_apis_on_doc_id"
  add_index "apis", ["path", "doc_id", "http_method"], :name => "index_apis_on_path_and_doc_id_and_http_method"
  add_index "apis", ["resource_id"], :name => "index_apis_on_resource_id"

  create_table "docs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.string   "api_version"
    t.string   "base_path"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "docs", ["name"], :name => "index_docs_on_name"
  add_index "docs", ["user_id"], :name => "index_docs_on_user_id"

  create_table "operations", :force => true do |t|
    t.integer  "api_id"
    t.string   "http_method"
    t.string   "nickname"
    t.string   "response_class"
    t.string   "summary"
    t.string   "note"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "operations", ["api_id"], :name => "index_operations_on_api_id"

  create_table "parameters", :force => true do |t|
    t.integer  "api_id"
    t.string   "param_type"
    t.string   "name"
    t.string   "description"
    t.string   "data_type"
    t.boolean  "required"
    t.text     "allowable_values"
    t.boolean  "allow_multiple"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "parameters", ["api_id"], :name => "index_parameters_on_api_id"

  create_table "resources", :force => true do |t|
    t.integer  "doc_id"
    t.string   "name"
    t.string   "description"
    t.integer  "sort",        :default => 999
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "resources", ["doc_id"], :name => "index_resources_on_doc_id"

  create_table "users", :force => true do |t|
    t.string   "email",               :default => "", :null => false
    t.string   "name"
    t.string   "facebook_id"
    t.string   "encrypted_password",  :default => "", :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["facebook_id"], :name => "index_users_on_facebook_id"

end
