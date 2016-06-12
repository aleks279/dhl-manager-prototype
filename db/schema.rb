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

ActiveRecord::Schema.define(version: 20160612010802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "location_id"
    t.integer  "schedule_id"
  end

  add_index "clients", ["location_id"], name: "index_clients_on_location_id", using: :btree
  add_index "clients", ["schedule_id"], name: "index_clients_on_schedule_id", using: :btree

  create_table "clients_locations", id: false, force: :cascade do |t|
  end

  create_table "clients_schedule", id: false, force: :cascade do |t|
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.string   "identity_card_number"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "fuel_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incidents", force: :cascade do |t|
    t.datetime "date"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.decimal  "latitude",   precision: 10, scale: 6
    t.decimal  "longitude",  precision: 10, scale: 6
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "origin_country"
    t.decimal  "price"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "payment_type_id"
  end

  add_index "orders", ["payment_type_id"], name: "index_orders_on_payment_type_id", using: :btree

  create_table "orders_payment_types", id: false, force: :cascade do |t|
  end

  create_table "orders_warehouses", id: false, force: :cascade do |t|
    t.integer "orders_id"
    t.integer "warehouse_id"
  end

  add_index "orders_warehouses", ["orders_id"], name: "index_orders_warehouses_on_orders_id", using: :btree
  add_index "orders_warehouses", ["warehouse_id"], name: "index_orders_warehouses_on_warehouse_id", using: :btree

  create_table "payment_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "payment_deadline"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "presentations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.float    "weight"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "category_id"
    t.integer  "type_id"
    t.integer  "brand_id"
    t.integer  "presentation_id"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["presentation_id"], name: "index_products_on_presentation_id", using: :btree
  add_index "products", ["type_id"], name: "index_products_on_type_id", using: :btree

  create_table "products_brands", id: false, force: :cascade do |t|
  end

  create_table "products_categories", id: false, force: :cascade do |t|
  end

  create_table "products_presentations", id: false, force: :cascade do |t|
  end

  create_table "products_types", id: false, force: :cascade do |t|
  end

  create_table "products_warehouses", id: false, force: :cascade do |t|
    t.integer "products_id"
    t.integer "warehouse_id"
  end

  add_index "products_warehouses", ["products_id"], name: "index_products_warehouses_on_products_id", using: :btree
  add_index "products_warehouses", ["warehouse_id"], name: "index_products_warehouses_on_warehouse_id", using: :btree

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes_clients", id: false, force: :cascade do |t|
    t.integer "clients_id"
    t.integer "route_id"
  end

  add_index "routes_clients", ["clients_id"], name: "index_routes_clients_on_clients_id", using: :btree
  add_index "routes_clients", ["route_id"], name: "index_routes_clients_on_route_id", using: :btree

  create_table "routes_drivers", id: false, force: :cascade do |t|
    t.integer "drivers_id"
    t.integer "route_id"
  end

  add_index "routes_drivers", ["drivers_id"], name: "index_routes_drivers_on_drivers_id", using: :btree
  add_index "routes_drivers", ["route_id"], name: "index_routes_drivers_on_route_id", using: :btree

  create_table "routes_incidents", id: false, force: :cascade do |t|
    t.integer "incidents_id"
    t.integer "route_id"
  end

  add_index "routes_incidents", ["incidents_id"], name: "index_routes_incidents_on_incidents_id", using: :btree
  add_index "routes_incidents", ["route_id"], name: "index_routes_incidents_on_route_id", using: :btree

  create_table "routes_trucks", id: false, force: :cascade do |t|
    t.integer "trucks_id"
    t.integer "route_id"
  end

  add_index "routes_trucks", ["route_id"], name: "index_routes_trucks_on_route_id", using: :btree
  add_index "routes_trucks", ["trucks_id"], name: "index_routes_trucks_on_trucks_id", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.date     "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states_drivers", id: false, force: :cascade do |t|
    t.integer "states_id"
    t.integer "driver_id"
  end

  add_index "states_drivers", ["driver_id"], name: "index_states_drivers_on_driver_id", using: :btree
  add_index "states_drivers", ["states_id"], name: "index_states_drivers_on_states_id", using: :btree

  create_table "states_trucks", id: false, force: :cascade do |t|
    t.integer "states_id"
    t.integer "truck_id"
  end

  add_index "states_trucks", ["states_id"], name: "index_states_trucks_on_states_id", using: :btree
  add_index "states_trucks", ["truck_id"], name: "index_states_trucks_on_truck_id", using: :btree

  create_table "trucks", force: :cascade do |t|
    t.string   "plate_number"
    t.integer  "year"
    t.string   "model"
    t.float    "weight_capacity"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "location_id"
  end

  add_index "trucks", ["location_id"], name: "index_trucks_on_location_id", using: :btree

  create_table "trucks_locations", id: false, force: :cascade do |t|
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "warehouses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clients", "locations"
  add_foreign_key "clients", "schedules"
  add_foreign_key "orders", "payment_types"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "presentations"
  add_foreign_key "products", "types"
  add_foreign_key "trucks", "locations"
end
