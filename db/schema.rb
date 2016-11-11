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

ActiveRecord::Schema.define(version: 20161107204847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analysts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audits", force: true do |t|
    t.integer  "instructor_id"
    t.integer  "lesson_plan_id"
    t.boolean  "big_flag",           default: false
    t.text     "video_url"
    t.boolean  "fame",               default: false
    t.text     "fame_notes"
    t.boolean  "objs",               default: false
    t.boolean  "action_flag",        default: false
    t.integer  "vocal_enc_num"
    t.integer  "discuss_num"
    t.integer  "mov_aw_noi_num"
    t.integer  "mean_quest_num"
    t.integer  "directed_quest_num"
    t.integer  "tangent_num"
    t.text     "tangent_notes"
    t.boolean  "fifteen_noeng",      default: false
    t.integer  "anti_jargon_num"
    t.text     "anti_jargon_notes"
    t.boolean  "nervous",            default: false
    t.integer  "engage_num"
    t.text     "engage_notes"
    t.string   "percent_lp"
    t.string   "percent_hp_lp"
    t.integer  "overall_num"
    t.text     "overall_factors"
    t.integer  "audio_qual_num"
    t.boolean  "code_is_no_big",     default: false
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "audit_date"
    t.boolean  "sent_email",         default: false
  end

  add_index "audits", ["instructor_id"], name: "index_audits_on_instructor_id", using: :btree
  add_index "audits", ["lesson_plan_id"], name: "index_audits_on_lesson_plan_id", using: :btree

  create_table "instructors", force: true do |t|
    t.integer  "university_id"
    t.string   "instructor"
    t.string   "email"
    t.string   "phone"
    t.string   "class_code"
    t.date     "hired_date"
    t.date     "start_date"
    t.date     "dry_run_date"
    t.boolean  "pre_quiz_taken", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tier_id"
  end

  add_index "instructors", ["university_id"], name: "index_instructors_on_university_id", using: :btree

  create_table "lesson_plans", force: true do |t|
    t.decimal  "lp"
    t.text     "lp_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rds", force: true do |t|
    t.string   "rd"
    t.string   "rd_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sses", force: true do |t|
    t.integer  "university_id"
    t.string   "ss"
    t.string   "ss_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sses", ["university_id"], name: "index_sses_on_university_id", using: :btree

  create_table "student_success_managers", force: true do |t|
    t.integer  "university_id"
    t.string   "ss"
    t.string   "ss_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_success_managers", ["university_id"], name: "index_student_success_managers_on_university_id", using: :btree

  create_table "tier_updates", force: true do |t|
    t.integer  "instructor_id"
    t.integer  "old_tier"
    t.integer  "new_tier"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tier_updates", ["instructor_id"], name: "index_tier_updates_on_instructor_id", using: :btree

  create_table "tiers", force: true do |t|
    t.integer  "tier"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "universities", force: true do |t|
    t.string   "university"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rd_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "role"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
