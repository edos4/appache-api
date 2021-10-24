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

ActiveRecord::Schema.define(version: 2021_10_24_220034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accountings", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.uuid "user_id"
    t.date "date_hired"
    t.string "department"
    t.string "position"
    t.string "address"
    t.string "contact_number"
    t.string "meeting_link"
    t.date "birthday"
    t.date "last_day"
    t.float "pay_rate"
    t.float "total_earned"
    t.string "employment_contract"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "alpha_teams", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.uuid "user_id"
    t.date "date_hired"
    t.string "department"
    t.string "position"
    t.string "address"
    t.string "contact_number"
    t.string "meeting_link"
    t.date "birthday"
    t.date "last_day"
    t.float "pay_rate"
    t.float "total_earned"
    t.string "employment_contract"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "campaigns", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "details"
    t.string "status"
    t.string "attachments"
    t.date "start_date"
    t.date "end_date"
    t.string "tags"
    t.float "total_spent"
    t.string "fb_leads"
    t.string "cpl"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "fb_campaign_id"
    t.uuid "studio_id"
  end

  create_table "leads", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "source"
    t.string "firstname"
    t.string "lastname"
    t.string "phone"
    t.string "status"
    t.text "notes"
    t.uuid "assigned"
    t.date "sale_date"
    t.string "deal"
    t.string "deal_status"
    t.date "deal_date"
    t.float "lbe_price"
    t.date "lbe_start_date"
    t.uuid "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "campaign_name"
    t.uuid "campaign_id"
    t.string "ad_name"
    t.string "ad_id"
    t.string "adset_name"
    t.string "platform"
    t.boolean "is_organic", default: false
    t.string "integrately_id"
    t.string "email"
    t.uuid "studio_id"
    t.string "fb_campaign_id"
    t.string "addset_id"
  end

  create_table "pit_crews", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.uuid "user_id"
    t.date "date_hired"
    t.string "department"
    t.string "position"
    t.string "address"
    t.string "contact_number"
    t.string "meeting_link"
    t.date "birthday"
    t.date "last_day"
    t.float "pay_rate"
    t.float "total_earned"
    t.string "employment_contract"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rockets", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.uuid "user_id"
    t.date "date_hired"
    t.string "department"
    t.string "position"
    t.string "address"
    t.string "contact_number"
    t.string "meeting_link"
    t.date "birthday"
    t.date "last_day"
    t.float "pay_rate"
    t.float "total_earned"
    t.string "employment_contract"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "staffs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.uuid "user_id"
    t.string "date_hired"
    t.string "department"
    t.string "position"
    t.string "address"
    t.string "meeting_link"
    t.string "birthday"
    t.date "last_day"
    t.float "pay_rate"
    t.float "total_earned"
    t.string "employment_contract"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.string "job_description"
    t.string "email"
    t.string "status"
    t.string "role"
    t.string "contact_number"
  end

  create_table "students", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "studio_leads", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "studio_id"
  end

  create_table "studio_managers", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.uuid "studio_id"
    t.uuid "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "studio_owners", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.uuid "user_id"
    t.string "mobile_number"
    t.string "facebook"
    t.string "linkedin"
    t.uuid "studio_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "studios", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "campaign_id"
    t.uuid "studio_manager_id"
    t.uuid "studio_owner_id"
    t.string "phone"
    t.string "services_offered"
    t.uuid "assigned_rocket"
    t.uuid "assigned_pitcrew"
    t.uuid "assigned_wolf"
    t.string "account_id"
    t.string "fb_account_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wolves", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.uuid "user_id"
    t.date "date_hired"
    t.string "department"
    t.string "position"
    t.string "address"
    t.string "contact_number"
    t.string "meeting_link"
    t.date "birthday"
    t.date "last_day"
    t.float "pay_rate"
    t.float "total_earned"
    t.string "employment_contract"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wolves_comissions", force: :cascade do |t|
    t.integer "total_calls"
    t.integer "actual_conversation"
    t.float "win_rate"
    t.float "commissions"
    t.float "bonus"
    t.float "total_payout"
    t.uuid "wolf_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
