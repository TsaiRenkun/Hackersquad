# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_24_054455) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attends", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "role_id"
    t.bigint "group_id"
    t.index ["event_id"], name: "index_attends_on_event_id"
    t.index ["group_id"], name: "index_attends_on_group_id"
    t.index ["role_id"], name: "index_attends_on_role_id"
    t.index ["user_id"], name: "index_attends_on_user_id"
  end

  create_table "attends_groups", force: :cascade do |t|
    t.bigint "attend_id"
    t.bigint "group_id"
    t.index ["attend_id"], name: "index_attends_groups_on_attend_id"
    t.index ["group_id"], name: "index_attends_groups_on_group_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "group_id"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["group_id"], name: "index_comments_on_group_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "user_id"
    t.text "name"
    t.text "description"
    t.date "date"
    t.text "location"
    t.text "img"
    t.integer "max_group"
    t.integer "max_per_group"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "developer"
    t.integer "ux"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "event_id"
    t.text "group_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "developer"
    t.integer "ux"
    t.index ["event_id"], name: "index_groups_on_event_id"
  end

  create_table "roles", force: :cascade do |t|
    t.text "name"
  end

  create_table "userprofiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "username"
    t.string "description"
    t.string "img"
    t.index ["user_id"], name: "index_userprofiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "users"
end
