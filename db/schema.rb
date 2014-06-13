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

ActiveRecord::Schema.define(version: 20140613203148) do

  create_table "classes", force: true do |t|
    t.integer  "course_schedule_id"
    t.datetime "class_datetime"
    t.string   "day_of_week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_schedules", force: true do |t|
    t.integer  "course_id"
    t.integer  "quarter_id"
    t.integer  "section_id"
    t.integer  "instructor_id"
    t.string   "day_of_week"
    t.time     "time_of_day"
    t.string   "campus"
    t.string   "location"
    t.date     "first_class_date"
    t.date     "last_class_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.integer  "school_course_id"
    t.string   "title"
    t.string   "status"
    t.integer  "effective_start_quarter_id"
    t.integer  "effective_end_quarter_id"
    t.string   "school_url"
    t.float    "credits"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructor_course_schedules", force: true do |t|
    t.integer  "instructor_id"
    t.integer  "course_schedule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "school_userid"
    t.string   "school_username"
    t.string   "school_email"
    t.string   "avatar_url"
    t.string   "school_dept"
    t.string   "school_bio_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quarters", force: true do |t|
    t.string   "term"
    t.string   "academic_year"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_course_schedules", force: true do |t|
    t.integer  "student_id"
    t.integer  "course_schedule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "school_userid"
    t.string   "school_username"
    t.string   "school_email"
    t.string   "avatar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "student_id"
    t.string   "school_email"
    t.string   "personal_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "work_industry"
    t.string   "work_employer"
    t.string   "work_job"
    t.integer  "target_graduation_year"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "avatar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end