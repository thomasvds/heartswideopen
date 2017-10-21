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

ActiveRecord::Schema.define(version: 20171021133110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "configuration_books", force: :cascade do |t|
    t.datetime "last_availability_request_sent_at"
  end

  create_table "slots", force: :cascade do |t|
    t.boolean "available", default: true
    t.boolean "selected", default: false
    t.datetime "date"
    t.bigint "volunteer_id"
    t.text "comments"
    t.index ["volunteer_id"], name: "index_slots_on_volunteer_id"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "nickname"
    t.string "email"
    t.string "mobile_phone_number"
    t.integer "number_of_beds", default: 1
    t.boolean "active", default: true
    t.datetime "last_queried_at"
    t.boolean "can_be_driver"
    t.boolean "available_mon", default: false
    t.boolean "available_tue", default: false
    t.boolean "available_wed", default: false
    t.boolean "available_thu", default: false
    t.boolean "available_fri", default: false
    t.boolean "available_sat", default: false
    t.boolean "available_sun", default: false
    t.text "comments"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
  end

  add_foreign_key "slots", "volunteers"
end
