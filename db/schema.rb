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

ActiveRecord::Schema.define(version: 20160127022715) do

  create_table "access_categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "accessories", force: :cascade do |t|
    t.integer  "access_category_id", limit: 4
    t.text     "feature",            limit: 65535
    t.integer  "price",              limit: 4
    t.boolean  "available"
    t.text     "other_info",         limit: 65535
    t.string   "name",               limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
  end

  add_index "accessories", ["access_category_id"], name: "index_accessories_on_access_category_id", using: :btree

  create_table "admins", force: :cascade do |t|
    t.string   "f_name",          limit: 255
    t.string   "l_name",          limit: 255
    t.string   "email",           limit: 255
    t.string   "admin_type",      limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "username",        limit: 255
    t.string   "password_digest", limit: 255
  end

  create_table "devices", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "model",       limit: 255
    t.string   "device_type", limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
