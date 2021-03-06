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

ActiveRecord::Schema.define(version: 2019_08_17_143847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "time_zone", default: "Central Time (US & Canada)"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "babies", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.date "dob"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "height"
    t.string "weight"
    t.string "slug"
    t.string "baby_thumb"
    t.index ["account_id"], name: "index_babies_on_account_id"
    t.index ["slug"], name: "index_babies_on_slug", unique: true
  end

  create_table "diapers", force: :cascade do |t|
    t.time "time"
    t.string "size"
    t.string "color"
    t.text "note"
    t.bigint "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "pee", default: false, null: false
    t.boolean "poo", default: false, null: false
    t.string "texture"
    t.index ["entry_id"], name: "index_diapers_on_entry_id"
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "baby_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "diapers_count", default: 0, null: false
    t.integer "bath", default: 0
    t.index ["account_id"], name: "index_entries_on_account_id"
    t.index ["baby_id"], name: "index_entries_on_baby_id"
  end

  create_table "feedings", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.float "amount"
    t.bigint "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "feeding_notes"
    t.index ["entry_id"], name: "index_feedings_on_entry_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "sleeps", force: :cascade do |t|
    t.string "start_time"
    t.string "end_time"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notes"
    t.bigint "entry_id"
    t.boolean "in_progress", default: false
    t.index ["entry_id"], name: "index_sleeps_on_entry_id"
  end

  add_foreign_key "babies", "accounts"
  add_foreign_key "diapers", "entries"
  add_foreign_key "entries", "accounts"
  add_foreign_key "entries", "babies"
  add_foreign_key "feedings", "entries"
  add_foreign_key "sleeps", "entries"
end
