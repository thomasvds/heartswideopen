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

ActiveRecord::Schema.define(version: 20171021075321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "volunteers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "mobile_phone_number"
    t.integer "number_of_beds"
    t.boolean "is_active"
    t.boolean "available_mon"
    t.boolean "available_tue"
    t.boolean "available_wed"
    t.boolean "available_thu"
    t.boolean "available_fri"
    t.boolean "available_sat"
    t.boolean "available_sun"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
  end

end
