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

ActiveRecord::Schema.define(version: 2019_11_19_031752) do

  create_table "bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "subpitch_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "message"
    t.integer "status", default: 2
    t.decimal "total_price", precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subpitch_id"], name: "index_bookings_on_subpitch_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "pitches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "description"
    t.string "country"
    t.string "city"
    t.string "district"
    t.string "address"
    t.string "phone"
    t.text "picture"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "limit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pitches_on_user_id"
  end

  create_table "ratings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "booking_id", null: false
    t.integer "star"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_ratings_on_booking_id", unique: true
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "subpitch_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subpitches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "status", default: 0
    t.bigint "pitch_id", null: false
    t.decimal "price_per_hour", precision: 10
    t.string "currency"
    t.text "picture"
    t.string "size"
    t.bigint "subpitch_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pitch_id"], name: "index_subpitches_on_pitch_id"
    t.index ["subpitch_type_id"], name: "index_subpitches_on_subpitch_type_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "avatar"
    t.boolean "activated"
    t.string "activated_digest"
    t.datetime "activated_at"
    t.string "email"
    t.string "full_name"
    t.boolean "gender"
    t.string "phone"
    t.string "password_digest"
    t.string "reset_digest"
    t.integer "role", default: 2
    t.datetime "reset_sent_at"
    t.string "remember_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bookings", "subpitches"
  add_foreign_key "bookings", "users"
  add_foreign_key "pitches", "users"
  add_foreign_key "ratings", "bookings"
  add_foreign_key "ratings", "users"
  add_foreign_key "subpitches", "pitches"
  add_foreign_key "subpitches", "subpitch_types"
end
