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

ActiveRecord::Schema.define(:version => 20130321165258) do

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "unit"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "student_id"
    t.integer  "parent_id"
    t.string   "address_type"
  end

  create_table "guardianships", :force => true do |t|
    t.integer  "student_id"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "parents", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "home_phone"
    t.string   "work_phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schools", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
  end

  create_table "students", :force => true do |t|
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.string   "email"
    t.string   "empl"
    t.date     "dob"
    t.string   "medical_issues"
    t.integer  "school_id"
    t.string   "gender"
    t.string   "grade_level"
  end

end
