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

ActiveRecord::Schema.define(version: 20170524164123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sports", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "icon",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sports_on_name", unique: true, using: :btree
  end

  create_table "sports_interests", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "sport_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_sports_interests_on_sport_id", using: :btree
    t.index ["user_id"], name: "index_sports_interests_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "first_name"
    t.string   "last_name"
    t.float    "height_inches"
    t.float    "weight_pounds"
    t.boolean  "private_profile"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "sports_interests", "sports"
  add_foreign_key "sports_interests", "users"
end
