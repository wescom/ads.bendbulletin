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

ActiveRecord::Schema.define(:version => 20130913225253) do

  create_table "global_settings", :force => true do |t|
    t.text     "general_instructions"
    t.text     "disclaimer"
    t.string   "contact_email"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.text     "welcome"
  end

  create_table "job_files", :force => true do |t|
    t.integer  "job_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "file_type",         :default => "job_file"
  end

  create_table "jobs", :force => true do |t|
    t.integer  "upload_type_id"
    t.integer  "user_id"
    t.string   "name",                                                :null => false
    t.string   "company"
    t.string   "salesrep"
    t.string   "acct_no"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state",               :limit => 2
    t.integer  "zip",                 :limit => 8
    t.string   "email"
    t.string   "phonenum"
    t.string   "phonenum2"
    t.string   "fax"
    t.date     "startdate"
    t.string   "application"
    t.string   "application_other"
    t.string   "application_version"
    t.string   "platform"
    t.string   "image_format"
    t.string   "vector_format"
    t.string   "color_spec"
    t.string   "job_type"
    t.boolean  "trapping",                         :default => false
    t.string   "files_to_run"
    t.text     "instructions"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.boolean  "disclaimer"
  end

  add_index "jobs", ["name"], :name => "index_jobs_on_name"
  add_index "jobs", ["upload_type_id"], :name => "index_jobs_on_upload_type_id"
  add_index "jobs", ["user_id"], :name => "index_jobs_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "upload_types", :force => true do |t|
    t.string   "name",                                    :null => false
    t.string   "tab_name",                                :null => false
    t.integer  "tab_sort",             :default => 0,     :null => false
    t.text     "description"
    t.text     "instructions"
    t.string   "email_recipient"
    t.boolean  "get_startdate",        :default => false
    t.boolean  "get_application_used", :default => false
    t.boolean  "get_platform",         :default => false
    t.boolean  "get_image_format",     :default => false
    t.boolean  "get_vector_format",    :default => false
    t.boolean  "get_color_spec",       :default => false
    t.boolean  "get_job_type",         :default => false
    t.boolean  "get_trapping",         :default => false
    t.boolean  "get_files_to_run",     :default => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",                  :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "name"
    t.string   "company"
    t.string   "acct_no"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state",                  :limit => 2
    t.string   "zip",                    :limit => 5
    t.string   "phonenum"
    t.string   "phonenum2"
    t.string   "fax"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
