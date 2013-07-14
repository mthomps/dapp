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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130713223732) do

  create_table "doctors", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_salt"
    t.string   "password_digest"
    t.string   "phone_number"
    t.string   "healthcare_provider"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "doctors", ["email"], :name => "index_doctors_on_email"

  create_table "patients", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "password_salt"
    t.string   "password_digest"
    t.string   "carb_ratio"
    t.string   "settings"
    t.integer  "age"
    t.integer  "doctor_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "patients", ["doctor_id"], :name => "index_patients_on_doctor_id"
  add_index "patients", ["email"], :name => "index_patients_on_email"

  create_table "readings", :force => true do |t|
    t.integer  "read_time"
    t.integer  "blood_glucose"
    t.integer  "carbs"
    t.integer  "insulin"
    t.boolean  "exercised"
    t.string   "notes"
    t.integer  "patient_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "readings", ["patient_id"], :name => "index_readings_on_patient_id"

  create_table "time_settings", :force => true do |t|
    t.integer  "time"
    t.string   "value"
    t.string   "category"
    t.integer  "patient_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "time_settings", ["patient_id"], :name => "index_time_settings_on_patient_id"

end
