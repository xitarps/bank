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

ActiveRecord::Schema[7.0].define(version: 2023_06_04_194902) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.decimal "amount", precision: 5, scale: 2, default: "0.0", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_accounts_on_customer_id"
  end

  create_table "administrators", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "name", null: false
    t.string "course", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_lists", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_contact_lists_on_customer_id"
  end

  create_table "customer_classes", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "classroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_customer_classes_on_classroom_id"
    t.index ["customer_id"], name: "index_customer_classes_on_customer_id"
  end

  create_table "customer_contact_lists", force: :cascade do |t|
    t.bigint "contact_list_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_list_id"], name: "index_customer_contact_lists_on_contact_list_id"
    t.index ["customer_id"], name: "index_customer_contact_lists_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name", limit: 255, null: false
    t.string "last_name", limit: 255, null: false
    t.string "cpf", limit: 11, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investments", force: :cascade do |t|
    t.string "amount", null: false
    t.bigint "account_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_investments_on_account_id"
    t.index ["product_id"], name: "index_investments_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.date "start_date", null: false
    t.date "final_date", null: false
    t.decimal "minimum_amount", null: false
    t.bigint "tax_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tax_id"], name: "index_products_on_tax_id"
  end

  create_table "roots", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "value", precision: 5, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transfers", force: :cascade do |t|
    t.decimal "amount", precision: 5, scale: 2, default: "0.0"
    t.integer "status", default: 5, null: false
    t.date "trade_date", default: "2023-06-08", null: false
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_transfers_on_receiver_id"
    t.index ["sender_id"], name: "index_transfers_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "userable_type", null: false
    t.bigint "userable_id", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["userable_type", "userable_id"], name: "index_users_on_userable"
  end

  add_foreign_key "accounts", "customers"
  add_foreign_key "contact_lists", "customers"
  add_foreign_key "customer_classes", "classrooms"
  add_foreign_key "customer_classes", "customers"
  add_foreign_key "customer_contact_lists", "contact_lists"
  add_foreign_key "customer_contact_lists", "customers"
  add_foreign_key "investments", "accounts"
  add_foreign_key "investments", "products"
  add_foreign_key "products", "taxes"
  add_foreign_key "transfers", "accounts", column: "receiver_id"
  add_foreign_key "transfers", "accounts", column: "sender_id"
end
