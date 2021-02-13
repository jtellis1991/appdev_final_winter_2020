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

ActiveRecord::Schema.define(version: 2021_02_13_020320) do

  create_table "answers", force: :cascade do |t|
    t.string "correct_answer"
    t.integer "question_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "choices", force: :cascade do |t|
    t.integer "response_id"
    t.integer "option_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "explanations", force: :cascade do |t|
    t.integer "position"
    t.text "image"
    t.text "description"
    t.string "explainable_type"
    t.integer "explainable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["explainable_type", "explainable_id"], name: "index_explanations_on_explainable"
  end

  create_table "implementations", force: :cascade do |t|
    t.integer "question_id"
    t.integer "strategy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mistakes", force: :cascade do |t|
    t.text "erroneous_answer"
    t.integer "question_id"
    t.integer "root_cause_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "value"
    t.integer "question_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "correct"
  end

  create_table "phrases", force: :cascade do |t|
    t.text "text_to_translate"
    t.text "translated_text"
    t.integer "question_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text "body"
    t.text "prompt"
    t.string "official_id"
    t.string "image"
    t.integer "difficulty"
    t.integer "test_id"
    t.integer "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "style_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "milliseconds_elapsed"
    t.integer "user_id"
    t.integer "question_id"
    t.integer "test_attempt_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "correct"
    t.string "first"
    t.string "second"
    t.string "third"
    t.string "fourth"
  end

  create_table "root_causes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "strategies", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "test_attempts", force: :cascade do |t|
    t.integer "score"
    t.integer "user_id"
    t.integer "test_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.string "testable_type"
    t.integer "testable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["testable_type", "testable_id"], name: "index_tests_on_testable"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "choices", "options"
  add_foreign_key "choices", "responses"
  add_foreign_key "implementations", "questions"
  add_foreign_key "implementations", "strategies"
  add_foreign_key "mistakes", "questions"
  add_foreign_key "mistakes", "root_causes"
  add_foreign_key "options", "questions"
  add_foreign_key "phrases", "questions"
  add_foreign_key "questions", "categories"
  add_foreign_key "questions", "styles"
  add_foreign_key "questions", "tests"
  add_foreign_key "responses", "questions"
  add_foreign_key "responses", "test_attempts"
  add_foreign_key "responses", "users"
  add_foreign_key "test_attempts", "tests"
  add_foreign_key "test_attempts", "users"
end
