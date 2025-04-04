# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_04_03_152356) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "species"
    t.date "date_of_birth"
    t.text "description"
    t.index ["user_id"], name: "index_dogs_on_user_id"
  end

  create_table "user_walks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "walk_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "walk_id"], name: "index_user_walks_on_user_id_and_walk_id", unique: true
    t.index ["user_id"], name: "index_user_walks_on_user_id"
    t.index ["walk_id"], name: "index_user_walks_on_walk_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "walks", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "number_of_dog"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.time "time"
    t.datetime "date"
    t.float "latitude"
    t.float "longitude"
    t.boolean "validated", default: false
  end

  add_foreign_key "dogs", "users"
  add_foreign_key "user_walks", "users"
  add_foreign_key "user_walks", "walks"
end
