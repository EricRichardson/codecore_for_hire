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

ActiveRecord::Schema.define(version: 20160709235110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educations", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "school"
    t.text     "description"
    t.string   "link"
    t.date     "start"
    t.date     "end"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "major"
  end

  add_index "educations", ["profile_id"], name: "index_educations_on_profile_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "company"
    t.string   "title"
    t.text     "description"
    t.date     "start"
    t.date     "end"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "experiences", ["profile_id"], name: "index_experiences_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "github"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "resume"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "link"
    t.string   "github"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "projects", ["profile_id"], name: "index_projects_on_profile_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "skills", ["profile_id"], name: "index_skills_on_profile_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "for_hire"
    t.boolean  "activated",       default: false
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "reset_token"
    t.datetime "sent_at"
    t.string   "profile_picture"
    t.string   "image"
    t.string   "resume"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "educations", "profiles"
  add_foreign_key "experiences", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "projects", "profiles"
  add_foreign_key "skills", "profiles"
end
