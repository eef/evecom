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

ActiveRecord::Schema.define(version: 20150114013343) do

  create_table "attr_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "icon_id"
    t.integer  "default_value"
    t.boolean  "published"
    t.string   "display_name"
    t.integer  "unit_id"
    t.boolean  "stackable"
    t.boolean  "high_is_good"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attrs", force: true do |t|
    t.integer  "market_item_id"
    t.integer  "attr_type_id"
    t.integer  "value_int"
    t.float    "value_float",    limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", force: true do |t|
    t.string   "character_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "character_id"
    t.datetime "dob"
    t.string   "race"
    t.string   "bloodline"
    t.string   "ancestry"
    t.string   "gender"
    t.string   "corporation_name"
    t.string   "corporation_id"
    t.string   "alliance_name"
    t.string   "allience_id"
    t.string   "faction_name"
    t.string   "faction_id"
    t.string   "clone_name"
    t.decimal  "clone_skillpoints",              precision: 16, scale: 2
    t.decimal  "account_balance",                precision: 16, scale: 2
    t.text     "skill_attributes"
    t.datetime "cached_until"
    t.integer  "bitmask"
    t.datetime "key_expires"
    t.integer  "user_id"
    t.boolean  "active",                                                  default: false
    t.integer  "skill_points"
    t.datetime "next_training_ends"
    t.string   "ship_name"
    t.integer  "ship_type_id"
    t.string   "ship_type_name"
    t.string   "last_known_location"
    t.float    "security_status",     limit: 24
    t.string   "corporation"
    t.datetime "corporation_date"
    t.integer  "api_id"
    t.string   "api_vcode"
  end

  create_table "implants", force: true do |t|
    t.string   "implant_type"
    t.string   "name"
    t.integer  "value"
    t.integer  "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "market_item_id"
  end

  create_table "market_items", force: true do |t|
    t.integer  "group_id"
    t.string   "name"
    t.text     "description"
    t.float    "mass",                  limit: 24
    t.float    "value",                 limit: 24
    t.float    "capacity",              limit: 24
    t.integer  "portion_size"
    t.integer  "race_id"
    t.decimal  "base_price",                       precision: 19, scale: 4
    t.boolean  "published"
    t.integer  "market_group_id"
    t.float    "chance_of_duplicating", limit: 24
    t.integer  "icon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_book_groups", force: true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_books", force: true do |t|
    t.integer  "skill_book_group_id"
    t.string   "name"
    t.text     "description"
    t.float    "mass",                  limit: 24
    t.float    "value",                 limit: 24
    t.float    "capacity",              limit: 24
    t.integer  "portion_size"
    t.integer  "race_id"
    t.decimal  "base_price",                       precision: 10, scale: 0
    t.boolean  "published"
    t.integer  "market_group_id"
    t.float    "chance_of_duplicating", limit: 24
    t.integer  "icon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank"
    t.string   "primary_attribute"
    t.string   "secondary_attribute"
  end

  create_table "skills", force: true do |t|
    t.integer  "skill_book_id"
    t.integer  "skill_points"
    t.integer  "level"
    t.integer  "character_id"
    t.integer  "skill_book_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "traits", force: true do |t|
    t.integer  "intelligence"
    t.integer  "memory"
    t.integer  "charisma"
    t.integer  "willpower"
    t.integer  "perception"
    t.integer  "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider",                            null: false
    t.string   "uid",                    default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
