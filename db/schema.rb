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

ActiveRecord::Schema.define(version: 2024_08_04_150748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer "choice", null: false
    t.bigint "check_in_id"
    t.bigint "question_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["check_in_id"], name: "index_answers_on_check_in_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "check_in_screeners", force: :cascade do |t|
    t.string "status", default: "ready", null: false
    t.bigint "check_in_id"
    t.bigint "screener_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["check_in_id"], name: "index_check_in_screeners_on_check_in_id"
    t.index ["screener_id"], name: "index_check_in_screeners_on_screener_id"
  end

  create_table "check_ins", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "external_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "prompt"
    t.bigint "screener_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["screener_id"], name: "index_questions_on_screener_id"
  end

  create_table "screeners", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "answers", "check_ins"
  add_foreign_key "answers", "questions"
  add_foreign_key "check_in_screeners", "check_ins"
  add_foreign_key "check_in_screeners", "screeners"
  add_foreign_key "questions", "screeners"
end
