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

ActiveRecord::Schema.define(version: 20190511140701) do

  create_table "charging_slots", force: :cascade do |t|
    t.integer  "minutes",           limit: 4
    t.decimal  "price",                           precision: 10
    t.datetime "start_time",                                     null: false
    t.datetime "end_time",                                       null: false
    t.float    "consumption",       limit: 24
    t.text     "consumption_unit",  limit: 65535
    t.integer  "charging_slots_id", limit: 4
    t.integer  "vehicles_id",       limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "charging_slots", ["charging_slots_id"], name: "index_charging_slots_on_charging_slots_id", using: :btree
  add_index "charging_slots", ["vehicles_id"], name: "index_charging_slots_on_vehicles_id", using: :btree

  create_table "charging_stations", force: :cascade do |t|
    t.string   "name",          limit: 255, null: false
    t.string   "address",       limit: 255
    t.string   "latitude",      limit: 255
    t.string   "longitude",     limit: 255
    t.datetime "last_serviced"
    t.boolean  "status"
    t.float    "capacity",      limit: 24
    t.string   "unit",          limit: 255
    t.string   "charger_type",  limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "model_number",   limit: 255
    t.string   "model_type",     limit: 255
    t.string   "charge_percent", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
