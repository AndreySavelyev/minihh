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

ActiveRecord::Schema.define(version: 20150919130222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employee_skills", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "skill_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "employee_skills", ["employee_id"], name: "index_employee_skills_on_employee_id", using: :btree
  add_index "employee_skills", ["skill_id"], name: "index_employee_skills_on_skill_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.text     "contact_info"
    t.boolean  "job_search_status"
    t.integer  "salary"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "skills", ["name"], name: "index_skills_on_name", using: :btree

  create_table "vacancies", force: :cascade do |t|
    t.string   "name"
    t.date     "added_at"
    t.date     "expires_at"
    t.integer  "salary"
    t.text     "contact_info"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "vacancy_skills", force: :cascade do |t|
    t.integer  "vacancy_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vacancy_skills", ["skill_id"], name: "index_vacancy_skills_on_skill_id", using: :btree
  add_index "vacancy_skills", ["vacancy_id"], name: "index_vacancy_skills_on_vacancy_id", using: :btree

  add_foreign_key "employee_skills", "employees"
  add_foreign_key "employee_skills", "skills"
  add_foreign_key "vacancy_skills", "skills"
  add_foreign_key "vacancy_skills", "vacancies"
end
