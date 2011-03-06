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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110304085841) do

  create_table "dishes", :force => true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.integer  "restaurant_id"
    t.float    "price"
    t.string   "type"
    t.float    "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "cuisine"
    t.float    "rating"
    t.time     "open_time"
    t.time     "close_time"
    t.float    "price_range"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restuarants", :force => true do |t|
    t.string   "name"
    t.string   "cuisine"
    t.float    "price"
    t.integer  "user_id"
    t.string   "phone"
    t.time     "open_time"
    t.time     "close_time"
    t.string   "address"
    t.string   "email"
    t.float    "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
