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

ActiveRecord::Schema.define(version: 20170207112811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.text     "image_data"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "activity_creator_id"
    t.index ["activity_creator_id"], name: "index_activities_on_activity_creator_id", using: :btree
  end

  create_table "activity_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_activity_users_on_activity_id", using: :btree
    t.index ["user_id"], name: "index_activity_users_on_user_id", using: :btree
  end

  create_table "clarifais", force: :cascade do |t|
    t.string   "access_token"
    t.string   "expires_in"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "activity_user_id"
    t.integer  "task_id"
    t.text     "image_data"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["activity_user_id"], name: "index_photos_on_activity_user_id", using: :btree
    t.index ["task_id"], name: "index_photos_on_task_id", using: :btree
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "activity_id"
    t.text     "image_data"
    t.text     "learning_objectives"
    t.text     "instructions"
    t.text     "hints"
    t.string   "tag"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["activity_id"], name: "index_tasks_on_activity_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "activity_users", "activities"
  add_foreign_key "activity_users", "users"
  add_foreign_key "photos", "activity_users"
  add_foreign_key "photos", "tasks"
  add_foreign_key "tasks", "activities"
end
