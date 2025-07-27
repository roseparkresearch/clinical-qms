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

ActiveRecord::Schema[8.0].define(version: 2025_07_27_140945) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "adverse_events", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "visit_id", null: false
    t.string "severity"
    t.string "causality"
    t.boolean "serious"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.text "treatment"
    t.string "outcome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_adverse_events_on_patient_id"
    t.index ["visit_id"], name: "index_adverse_events_on_visit_id"
  end

  create_table "deviations", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "visit_id", null: false
    t.string "deviation_type"
    t.string "severity"
    t.text "description"
    t.text "root_cause"
    t.text "corrective_action"
    t.text "preventive_action"
    t.date "detected_date"
    t.date "resolved_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_deviations_on_patient_id"
    t.index ["visit_id"], name: "index_deviations_on_visit_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.string "document_type"
    t.string "version"
    t.string "status"
    t.string "file_path"
    t.text "description"
    t.bigint "uploaded_by_id", null: false
    t.datetime "uploaded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uploaded_by_id"], name: "index_documents_on_uploaded_by_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "patient_id"
    t.bigint "study_id", null: false
    t.string "status"
    t.date "enrollment_date"
    t.date "screening_date"
    t.json "demographics"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_id"], name: "index_patients_on_study_id"
  end

  create_table "queries", force: :cascade do |t|
    t.string "query_number"
    t.string "queryable_type", null: false
    t.bigint "queryable_id", null: false
    t.string "query_type"
    t.string "priority"
    t.string "status"
    t.string "title"
    t.text "description"
    t.string "field_name"
    t.string "expected_value"
    t.datetime "due_date"
    t.bigint "assigned_to_id", null: false
    t.bigint "created_by_id", null: false
    t.text "response"
    t.datetime "resolved_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assigned_to_id"], name: "index_queries_on_assigned_to_id"
    t.index ["created_by_id"], name: "index_queries_on_created_by_id"
    t.index ["queryable_type", "queryable_id"], name: "index_queries_on_queryable"
  end

  create_table "studies", force: :cascade do |t|
    t.string "name"
    t.string "protocol_number"
    t.string "version"
    t.string "status"
    t.string "principal_investigator"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "role"
    t.datetime "last_sign_in_at"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string "whodunnit"
    t.datetime "created_at"
    t.bigint "item_id", null: false
    t.string "item_type", null: false
    t.string "event", null: false
    t.text "object"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.integer "visit_number"
    t.string "visit_name"
    t.date "visit_date"
    t.string "status"
    t.date "visit_window_start"
    t.date "visit_window_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_visits_on_patient_id"
  end

  add_foreign_key "adverse_events", "patients"
  add_foreign_key "adverse_events", "visits"
  add_foreign_key "deviations", "patients"
  add_foreign_key "deviations", "visits"
  add_foreign_key "documents", "users", column: "uploaded_by_id"
  add_foreign_key "patients", "studies"
  add_foreign_key "queries", "users", column: "assigned_to_id"
  add_foreign_key "queries", "users", column: "created_by_id"
  add_foreign_key "visits", "patients"
end
