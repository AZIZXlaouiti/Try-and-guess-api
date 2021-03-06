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

ActiveRecord::Schema.define(version: 2021_12_07_175740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.string "content"
    t.string "chat_type", default: "chat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_chat_messages_on_room_id"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_members_on_room_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.boolean "game_started", default: false
    t.integer "max_round", default: 3
    t.integer "round", default: 1
    t.integer "max_users", default: 4
    t.integer "counter", default: 80
    t.string "chosen_word", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.boolean "online", default: false
    t.integer "score", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "chat_messages", "rooms"
  add_foreign_key "chat_messages", "users"
  add_foreign_key "members", "rooms"
  add_foreign_key "members", "users"
end
