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

ActiveRecord::Schema[7.0].define(version: 2022_12_07_134906) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "kind"
    t.text "notes"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "contract_prices", force: :cascade do |t|
    t.bigint "contract_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "price"
    t.string "price_currency"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_contract_prices_on_contract_id"
    t.index ["user_id"], name: "index_contract_prices_on_user_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.string "kind"
    t.bigint "property_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "base_price"
    t.string "base_price_currency"
    t.string "comision"
    t.string "guarantor_identity_kind"
    t.string "guarantor_identity_number"
    t.string "guarantee_address"
    t.string "security_deposit_amount"
    t.string "security_deposit_amount_currency"
    t.text "notes"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.bigint "guarantor_id"
    t.index ["guarantor_id"], name: "index_contracts_on_guarantor_id"
    t.index ["property_id"], name: "index_contracts_on_property_id"
    t.index ["tenant_id"], name: "index_contracts_on_tenant_id"
    t.index ["user_id"], name: "index_contracts_on_user_id"
  end

  create_table "incident_updates", force: :cascade do |t|
    t.bigint "incident_id", null: false
    t.text "notes"
    t.string "incident_status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_incident_updates_on_incident_id"
    t.index ["user_id"], name: "index_incident_updates_on_user_id"
  end

  create_table "incidents", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.bigint "contact_id", null: false
    t.string "kind"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_incidents_on_contact_id"
    t.index ["property_id"], name: "index_incidents_on_property_id"
    t.index ["user_id"], name: "index_incidents_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "property_reference"
    t.string "cadastral_reference"
    t.string "kind"
    t.string "address"
    t.string "apartment"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "postal_code"
    t.string "total_area"
    t.string "covered_area"
    t.integer "rooms"
    t.integer "bathrooms"
    t.string "amenities"
    t.string "price"
    t.string "price_currency"
    t.text "notes"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id"
    t.index ["owner_id"], name: "index_properties_on_owner_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "role"
    t.string "agency_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "contract_prices", "contracts"
  add_foreign_key "contract_prices", "users"
  add_foreign_key "contracts", "contacts", column: "guarantor_id"
  add_foreign_key "contracts", "contacts", column: "tenant_id"
  add_foreign_key "contracts", "properties"
  add_foreign_key "contracts", "users"
  add_foreign_key "incident_updates", "incidents"
  add_foreign_key "incident_updates", "users"
  add_foreign_key "incidents", "contacts"
  add_foreign_key "incidents", "properties"
  add_foreign_key "incidents", "users"
  add_foreign_key "properties", "contacts", column: "owner_id"
  add_foreign_key "properties", "users"
end
