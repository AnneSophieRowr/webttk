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

ActiveRecord::Schema.define(version: 20140514110508) do

  create_table "acts", force: true do |t|
    t.text     "description", null: false
    t.datetime "report_date", null: false
    t.integer  "user_id",     null: false
    t.integer  "issue_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "ip"
    t.boolean  "saved"
    t.string   "os"
    t.string   "infrastructure"
    t.integer  "user_id"
    t.string   "environment"
    t.string   "virtual"
    t.integer  "hypervisor_id"
    t.string   "service"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "criticality"
    t.boolean  "active",         default: true
  end

  create_table "issues", force: true do |t|
    t.integer  "status_id",      default: 1, null: false
    t.datetime "report_date",                null: false
    t.text     "description",                null: false
    t.integer  "created_by_id",              null: false
    t.integer  "notified_by_id",             null: false
    t.string   "application",                null: false
    t.text     "detailed_cause"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "closure_date"
    t.string   "detection",                  null: false
    t.string   "app_status"
    t.integer  "category_id"
    t.text     "problem"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "device_id",                  null: false
    t.integer  "followed_by_id"
    t.string   "impact",                     null: false
  end

  create_table "statuses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",              default: "",    null: false
    t.string   "encrypted_password", default: "",    null: false
    t.string   "last_name"
    t.string   "first_name",                         null: false
    t.boolean  "admin",              default: false, null: false
    t.integer  "sign_in_count",      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
