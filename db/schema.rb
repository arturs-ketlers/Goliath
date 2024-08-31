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

ActiveRecord::Schema.define(version: 2024_01_09_175633) do

  create_table "admin_users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "ckeditor_assets", charset: "utf8", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "event_participants", charset: "utf8", force: :cascade do |t|
    t.bigint "participant_id"
    t.bigint "event_id"
    t.string "team"
    t.decimal "total_distance", precision: 8, scale: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "event_team_id"
    t.index ["event_id"], name: "index_event_participants_on_event_id"
    t.index ["event_team_id"], name: "index_event_participants_on_event_team_id"
    t.index ["participant_id"], name: "index_event_participants_on_participant_id"
  end

  create_table "event_teams", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.decimal "total_distance", precision: 8, scale: 3
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slogan"
  end

  create_table "events", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "event_type"
    t.date "date_from"
    t.date "date_till"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "target_type"
    t.decimal "target", precision: 8, scale: 3
  end

  create_table "participants", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "team"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.decimal "total_distance", precision: 8, scale: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "last_result_date"
    t.decimal "height", precision: 4, scale: 2
  end

  create_table "results", charset: "utf8", force: :cascade do |t|
    t.decimal "distance", precision: 8, scale: 3
    t.bigint "event_participant_id", null: false
    t.date "date"
    t.integer "steps"
    t.text "comment"
    t.index ["event_participant_id"], name: "index_results_on_event_participant_id"
  end

  create_table "settings", charset: "utf8", force: :cascade do |t|
    t.string "category"
    t.string "key"
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "translation_setting_translations", charset: "utf8", force: :cascade do |t|
    t.bigint "translation_setting_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "content"
    t.index ["locale"], name: "index_translation_setting_translations_on_locale"
    t.index ["translation_setting_id"], name: "index_c54d1e2fee23dc6f811ae37eff51e34c0ea5c662"
  end

  create_table "translation_settings", charset: "utf8", force: :cascade do |t|
    t.string "key"
    t.string "content_type"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
