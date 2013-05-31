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

ActiveRecord::Schema.define(:version => 20130530220949) do

  create_table "element_experiments", :force => true do |t|
    t.integer  "element_id"
    t.integer  "experiment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "element_experiments", ["element_id"], :name => "index_element_experiments_on_element_id"
  add_index "element_experiments", ["experiment_id"], :name => "index_element_experiments_on_experiment_id"

  create_table "elements", :force => true do |t|
    t.string   "name"
    t.string   "sign"
    t.integer  "atnum"
    t.float    "atm"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "experiments", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "confirmatory_id"
    t.integer  "impact_id"
    t.text     "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "name"
    t.integer  "status"
    t.integer  "node_id"
    t.integer  "public"
    t.datetime "executed_at"
    t.text     "annotation"
  end

  create_table "experiments_impacts_params", :force => true do |t|
    t.integer  "experiment_id"
    t.integer  "impacts_param_id"
    t.string   "value"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "images", :force => true do |t|
    t.integer  "experiment_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  create_table "impacts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
    t.string   "link"
  end

  create_table "impacts_params", :force => true do |t|
    t.integer  "impact_id"
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nodes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "ancestry"
  end

  add_index "nodes", ["ancestry"], :name => "index_nodes_on_ancestry"

  create_table "sources", :force => true do |t|
    t.integer  "experiment_id"
    t.integer  "source_experiment_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",         :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "role"
    t.string   "name"
    t.string   "surname"
    t.string   "middle_name"
    t.string   "post"
    t.integer  "status"
  end

end
