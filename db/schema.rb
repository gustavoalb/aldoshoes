# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_220_603_013_140) do
  create_table "inventory_items", charset: "utf8", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.bigint "shoe_id", null: false
    t.integer "available_stock", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shoe_id"], name: "index_inventory_items_on_shoe_id"
    t.index ["store_id"], name: "index_inventory_items_on_store_id"
  end

  create_table "shoes", charset: "utf8", force: :cascade do |t|
    t.string "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inventory_items", "shoes"
  add_foreign_key "inventory_items", "stores"
end
