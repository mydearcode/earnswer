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

ActiveRecord::Schema.define(version: 2020_12_16_202534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "question_id", null: false
    t.text "body", null: false
    t.boolean "approved", default: false
    t.boolean "deleted", default: false
    t.boolean "reviewed", default: false
    t.boolean "solved", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "good_answer", default: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "title"
    t.bigint "poll_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["poll_id"], name: "index_options_on_poll_id"
  end

  create_table "participates", force: :cascade do |t|
    t.bigint "response_id", null: false
    t.bigint "poll_id", null: false
    t.bigint "option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["option_id"], name: "index_participates_on_option_id"
    t.index ["poll_id"], name: "index_participates_on_poll_id"
    t.index ["response_id"], name: "index_participates_on_response_id"
  end

  create_table "polls", force: :cascade do |t|
    t.integer "questionType"
    t.boolean "finished", default: false
    t.boolean "deleted", default: false
    t.bigint "survey_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["survey_id"], name: "index_polls_on_survey_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.decimal "reward", null: false
    t.boolean "approved", default: false
    t.boolean "reviewed", default: false
    t.boolean "solved", default: false
    t.boolean "finished", default: false
    t.boolean "deleted", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "passed", default: false
    t.boolean "disbursed", default: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "survey_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["survey_id"], name: "index_responses_on_survey_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "reward", null: false
    t.boolean "approved", default: false
    t.boolean "reviewed", default: false
    t.boolean "solved", default: false
    t.boolean "finished", default: false
    t.boolean "deleted", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "budget", precision: 6, scale: 4, default: "0.0"
    t.boolean "approved", default: false
    t.boolean "banned", default: false
    t.boolean "deleted", default: false
    t.boolean "mail_activated", default: false
    t.boolean "sms_activated", default: false
    t.integer "role", default: 1
    t.boolean "admin", default: false
    t.decimal "freezed_budget", precision: 6, scale: 4, default: "0.0"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "options", "polls"
  add_foreign_key "participates", "options"
  add_foreign_key "participates", "polls"
  add_foreign_key "participates", "responses"
  add_foreign_key "polls", "surveys"
  add_foreign_key "questions", "users"
  add_foreign_key "responses", "surveys"
  add_foreign_key "responses", "users"
  add_foreign_key "surveys", "users"
end
