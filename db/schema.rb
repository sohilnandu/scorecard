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

ActiveRecord::Schema.define(version: 20140227053708) do

  create_table "scorecards", force: true do |t|
    t.integer  "site_id"
    t.string   "org_name"
    t.string   "vertical"
    t.integer  "total_records"
    t.integer  "wrong_address_count"
    t.float    "wrong_address_percent"
    t.integer  "invalid_address_count"
    t.float    "invalid_address_percent"
    t.integer  "deceased_count"
    t.float    "deceased_percent"
    t.integer  "missing_birthday_count"
    t.float    "missing_birthday_percent"
    t.integer  "missing_email_count"
    t.float    "missing_email_percent"
    t.integer  "missing_phone_number_count"
    t.float    "missing_phone_number_percent"
    t.integer  "missing_gender_count"
    t.float    "missing_gender_percent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scorecards", ["site_id"], name: "index_scorecards_on_site_id", unique: true

end
