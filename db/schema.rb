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

ActiveRecord::Schema.define(version: 2024_07_15_084958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_options", force: :cascade do |t|
    t.text "description"
    t.integer "value"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "screening_type_id"
    t.index ["screening_type_id"], name: "index_answer_options_on_screening_type_id"
  end

  create_table "check_ins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id", null: false
    t.index ["patient_id"], name: "index_check_ins_on_patient_id"
  end

  create_table "patient_screenings", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "screening_type_id", null: false
    t.date "screening_date"
    t.integer "total_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "check_in_id", null: false
    t.index ["check_in_id"], name: "index_patient_screenings_on_check_in_id"
    t.index ["patient_id"], name: "index_patient_screenings_on_patient_id"
    t.index ["screening_type_id"], name: "index_patient_screenings_on_screening_type_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "maiden_name"
    t.integer "age"
    t.string "gender"
    t.string "email"
    t.string "phone"
    t.string "username"
    t.string "birth_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "screening_type_id", null: false
    t.text "description"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["screening_type_id"], name: "index_questions_on_screening_type_id"
  end

  create_table "screening_types", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "check_ins", "patients"
  add_foreign_key "patient_screenings", "check_ins"
  add_foreign_key "patient_screenings", "patients"
  add_foreign_key "patient_screenings", "screening_types"
  add_foreign_key "questions", "screening_types"
end
