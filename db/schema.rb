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

ActiveRecord::Schema.define(version: 20171016080159) do

  create_table "analysts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audits", force: :cascade do |t|
    t.integer "instructor_id"
    t.integer "lesson_plan_id"
    t.boolean "big_flag", default: false
    t.text "video_url"
    t.boolean "fame", default: false
    t.text "fame_notes"
    t.boolean "objs", default: false
    t.boolean "action_flag", default: false
    t.integer "vocal_enc_num"
    t.integer "discuss_num"
    t.integer "mov_aw_noi_num"
    t.integer "mean_quest_num"
    t.integer "directed_quest_num"
    t.integer "tangent_num"
    t.text "tangent_notes"
    t.boolean "fifteen_noeng", default: false
    t.integer "anti_jargon_num"
    t.text "anti_jargon_notes"
    t.boolean "nervous", default: false
    t.integer "engage_num"
    t.text "engage_notes"
    t.string "percent_lp"
    t.string "percent_hp_lp"
    t.integer "overall_num"
    t.text "overall_factors"
    t.integer "audio_qual_num"
    t.boolean "code_is_no_big", default: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "audit_date"
    t.boolean "sent_email", default: false
    t.index ["instructor_id"], name: "index_audits_on_instructor_id"
    t.index ["lesson_plan_id"], name: "index_audits_on_lesson_plan_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.integer "user_id"
    t.string "full_name"
    t.string "email"
    t.string "phone_number"
    t.string "fax_number"
    t.string "address"
    t.string "state"
    t.string "zipcode"
    t.text "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "inrs", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "value"
    t.text "note"
    t.date "wdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_inrs_on_user_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.integer "university_id"
    t.string "instructor"
    t.string "email"
    t.string "phone"
    t.string "class_code"
    t.date "hired_date"
    t.date "start_date"
    t.boolean "pre_quiz_taken", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tier_id"
    t.boolean "active", default: true
    t.index ["university_id"], name: "index_instructors_on_university_id"
  end

  create_table "lesson_plans", force: :cascade do |t|
    t.decimal "lp"
    t.text "lp_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manegizations", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer "patient_id"
    t.string "interaction_type"
    t.boolean "training_meeting"
    t.text "note"
    t.date "wdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "noteable_type"
    t.integer "noteable_id"
    t.index ["noteable_type", "noteable_id"], name: "index_notes_on_noteable_type_and_noteable_id"
    t.index ["patient_id"], name: "index_notes_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.integer "user_id"
    t.string "first_name"
    t.string "middle_initial"
    t.string "last_name"
    t.string "email"
    t.boolean "qualified"
    t.string "communication_preferred"
    t.boolean "insurance_verification"
    t.boolean "prescription_acquired"
    t.string "phone_number"
    t.string "address"
    t.string "state"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "patients_reps", id: false, force: :cascade do |t|
    t.integer "rep_id", null: false
    t.integer "patient_id", null: false
    t.index ["patient_id", "rep_id"], name: "index_patients_reps_on_patient_id_and_rep_id"
    t.index ["rep_id", "patient_id"], name: "index_patients_reps_on_rep_id_and_patient_id"
  end

  create_table "rds", force: :cascade do |t|
    t.string "rd"
    t.string "rd_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reps", force: :cascade do |t|
    t.integer "user_id"
    t.string "full_name"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reps_on_user_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.integer "user_id"
    t.string "full_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_staffs_on_user_id"
  end

  create_table "student_feedbacks", force: :cascade do |t|
    t.string "class_code"
    t.integer "week"
    t.string "student_name"
    t.integer "how_class_week"
    t.integer "pace"
    t.integer "acad_supp"
    t.integer "new_learn"
    t.integer "mastery"
    t.integer "inst_engag"
    t.integer "inst_clarity"
    t.integer "inst_know"
    t.string "hours_outside"
    t.text "spend_time_on"
    t.text "pace_notes"
    t.text "support_notes"
    t.text "inst_notes"
    t.text "add_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_success_managers", force: :cascade do |t|
    t.integer "university_id"
    t.string "ss"
    t.string "ss_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["university_id"], name: "index_student_success_managers_on_university_id"
  end

  create_table "test_strip_requests", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "how_many_left"
    t.text "patient_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "dealt_with", default: false
    t.boolean "communicated_with", default: false
    t.index ["patient_id"], name: "index_test_strip_requests_on_patient_id"
  end

  create_table "tier_updates", force: :cascade do |t|
    t.integer "instructor_id"
    t.integer "old_tier"
    t.integer "new_tier"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_tier_updates_on_instructor_id"
  end

  create_table "tiers", force: :cascade do |t|
    t.integer "tier"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string "university"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rd_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_zone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
