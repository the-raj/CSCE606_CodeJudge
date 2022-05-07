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

ActiveRecord::Schema[7.0].define(version: 2022_05_07_220429) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "attempts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "problem_id", null: false
    t.text "code"
    t.bigint "language_id"
    t.index ["language_id"], name: "index_attempts_on_language_id"
    t.index ["problem_id"], name: "index_attempts_on_problem_id"
    t.index ["user_id"], name: "index_attempts_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "extension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pretty_name"
  end

  create_table "problems", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id"
    t.index ["author_id"], name: "index_problems_on_author_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.boolean "passed"
    t.text "stdout"
    t.text "stderr"
    t.bigint "attempt_id"
    t.bigint "test_case_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attempt_id"], name: "index_scores_on_attempt_id"
    t.index ["test_case_id"], name: "index_scores_on_test_case_id"
  end

  create_table "test_cases", force: :cascade do |t|
    t.bigint "problem_id"
    t.boolean "example", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "input"
    t.string "output"
    t.index ["problem_id"], name: "index_test_cases_on_problem_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "username"
    t.string "firstname"
    t.string "lastname"
    t.string "password_digest"
    t.string "google_id"
  end

  add_foreign_key "assignments", "roles"
  add_foreign_key "assignments", "users"
  add_foreign_key "attempts", "languages"
  add_foreign_key "attempts", "problems"
  add_foreign_key "attempts", "users"
  add_foreign_key "problems", "users", column: "author_id"
  add_foreign_key "scores", "attempts"
  add_foreign_key "scores", "test_cases"
  add_foreign_key "test_cases", "problems"
end
