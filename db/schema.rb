# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_01_020216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_levels", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "description", limit: 250
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bid_statuses", force: :cascade do |t|
    t.string "name", limit: 20
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bids", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "project_site_id", null: false
    t.bigint "sku_id", null: false
    t.bigint "bid_status_id", null: false
    t.datetime "bid_date"
    t.text "description"
    t.decimal "amount", precision: 6, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bid_status_id"], name: "index_bids_on_bid_status_id"
    t.index ["company_id"], name: "index_bids_on_company_id"
    t.index ["project_site_id"], name: "index_bids_on_project_site_id"
    t.index ["sku_id"], name: "index_bids_on_sku_id"
  end

  create_table "companies", force: :cascade do |t|
    t.bigint "company_category_id", null: false
    t.string "business_name", limit: 75
    t.string "contact_name", limit: 75
    t.string "address", limit: 75
    t.string "city", limit: 50
    t.bigint "state_id", null: false
    t.string "zipcode", limit: 6
    t.string "phone", limit: 14
    t.string "phone_ext", limit: 6
    t.string "fax", limit: 14
    t.string "email", limit: 50
    t.string "website", limit: 50
    t.bigint "image_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_category_id"], name: "index_companies_on_company_category_id"
    t.index ["image_id"], name: "index_companies_on_image_id"
    t.index ["state_id"], name: "index_companies_on_state_id"
  end

  create_table "company_categories", force: :cascade do |t|
    t.string "name", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "expense_categories", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "description", limit: 250
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "image_types", force: :cascade do |t|
    t.string "name", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "images", force: :cascade do |t|
    t.bigint "image_type_id", null: false
    t.string "filename", limit: 250
    t.string "title", limit: 75
    t.text "file_path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_type_id"], name: "index_images_on_image_type_id"
  end

  create_table "project_sites", force: :cascade do |t|
    t.string "address", limit: 100
    t.string "city", limit: 50
    t.bigint "state_id", null: false
    t.string "zipcode", limit: 6
    t.string "access_code", limit: 10
    t.text "map_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id"], name: "index_project_sites_on_state_id"
  end

  create_table "skus", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "description", limit: 250
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name", limit: 75
    t.string "abbreviation", limit: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "terms", force: :cascade do |t|
    t.string "name", limit: 150
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 50
    t.string "password", limit: 250
    t.bigint "access_level_id", null: false
    t.bigint "company_id", null: false
    t.string "name", limit: 50
    t.string "phone", limit: 14
    t.string "phone_ext", limit: 6
    t.string "email", limit: 100
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["access_level_id"], name: "index_users_on_access_level_id"
    t.index ["company_id"], name: "index_users_on_company_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.date "man_year"
    t.string "make", limit: 50
    t.string "model", limit: 50
    t.string "sub_model", limit: 50
    t.string "engine", limit: 50
    t.string "notes", limit: 150
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bids", "bid_statuses"
  add_foreign_key "bids", "companies"
  add_foreign_key "bids", "project_sites"
  add_foreign_key "bids", "skus"
  add_foreign_key "companies", "company_categories"
  add_foreign_key "companies", "images"
  add_foreign_key "companies", "states"
  add_foreign_key "images", "image_types"
  add_foreign_key "project_sites", "states"
  add_foreign_key "users", "access_levels"
  add_foreign_key "users", "companies"
end
