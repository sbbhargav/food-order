# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_29_125855) do
  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "food_store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_store_id"], name: "index_carts_on_food_store_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "food_items", force: :cascade do |t|
    t.string "item_name"
    t.integer "item_price"
    t.integer "food_store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_store_id"], name: "index_food_items_on_food_store_id"
  end

  create_table "food_stores", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "food_item_id", null: false
    t.integer "cart_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["food_item_id"], name: "index_line_items_on_food_item_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity"
    t.integer "food_store_id", null: false
    t.integer "food_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["food_item_id"], name: "index_orders_on_food_item_id"
    t.index ["food_store_id"], name: "index_orders_on_food_store_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "provider"
  end

  add_foreign_key "carts", "food_stores"
  add_foreign_key "carts", "users"
  add_foreign_key "food_items", "food_stores"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "food_items"
  add_foreign_key "orders", "food_items"
  add_foreign_key "orders", "food_stores"
  add_foreign_key "orders", "users"
end
