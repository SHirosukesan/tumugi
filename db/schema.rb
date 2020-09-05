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

ActiveRecord::Schema.define(version: 2020_09_05_084320) do

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assessments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", force: :cascade do |t|
    t.integer "chat_id"
    t.integer "my_publisher_id"
    t.integer "my_page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer "my_page_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hobies", force: :cascade do |t|
    t.integer "my_page_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matchings", force: :cascade do |t|
    t.integer "matching_id"
    t.integer "my_publisher_id"
    t.integer "my_page_id"
    t.boolean "status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "reset_password_token"
    t.integer "item_id", null: false
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "address", null: false
    t.integer "postalcode", null: false
    t.integer "image"
    t.string "nicname", null: false
    t.boolean "status", default: false, null: false
    t.integer "number", null: false
    t.integer "group_id", null: false
    t.string "profile"
    t.integer "age", null: false
    t.integer "competence", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_publishers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "reset_password_token"
    t.integer "item_id", null: false
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "address", null: false
    t.integer "postalcode", null: false
    t.integer "image", null: false
    t.string "nicname", null: false
    t.boolean "status", default: false, null: false
    t.integer "number", null: false
    t.integer "group_id", null: false
    t.string "profile", null: false
    t.integer "age", null: false
    t.integer "competence", null: false
    t.string "company_name", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "notification_id"
    t.integer "my_publisher_id"
    t.integer "my_page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.integer "my_page_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
