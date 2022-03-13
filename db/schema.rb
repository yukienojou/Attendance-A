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

ActiveRecord::Schema.define(version: 2022_02_13_120515) do

  create_table "attendances", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "note"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "indicater_check_edit"
    t.boolean "tomorrow_edit", default: false
    t.datetime "started_edit_at"
    t.datetime "started_before_at"
    t.datetime "finished_before_at"
    t.datetime "finished_edit_at"
    t.boolean "change_edit", default: false
    t.string "indicater_check_month_anser"
    t.string "indicater_check_month"
    t.integer "indicater_reply_edit"
    t.integer "indicater_reply_month"
    t.string "indicater_check"
    t.integer "indicater_reply"
    t.string "indicater_check_anser"
    t.string "indicater_check_edit_anser"
    t.datetime "overtime_finished_at"
    t.boolean "tomorrow", default: false
    t.string "overtime_work"
    t.boolean "change", default: false
    t.boolean "verification", default: false
    t.date "month_approval"
    t.boolean "change_month", default: false
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "bases", force: :cascade do |t|
    t.integer "base_number"
    t.string "base_name"
    t.text "information"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "department"
    t.datetime "basic_time", default: "2022-02-22 23:00:00"
    t.datetime "work_time", default: "2022-02-22 22:30:00"
    t.string "affiliation"
    t.string "employee_number"
    t.string "uid"
    t.datetime "basic_work_time", default: "2022-02-22 23:00:00"
    t.datetime "designated_work_start_time", default: "2022-02-23 00:00:00"
    t.datetime "designated_work_end_time", default: "2022-02-23 09:00:00"
    t.boolean "superior"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "attendances", "users"
  add_foreign_key "bases", "users"
end
