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

ActiveRecord::Schema.define(version: 20170715214836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "authors"
    t.text     "description"
    t.integer  "page_count"
    t.string   "thumbnail"
    t.integer  "x"
    t.integer  "y"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "query"
    t.integer  "image_analysis_id"
  end

  create_table "image_analyses", force: true do |t|
    t.string   "image_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "x1"
    t.integer  "y1"
    t.integer  "x2"
    t.integer  "y2"
    t.integer  "x3"
    t.integer  "y3"
    t.integer  "x4"
    t.integer  "y4"
  end

  create_table "image_analysis_texts", force: true do |t|
    t.string   "description"
    t.integer  "x1"
    t.integer  "y1"
    t.integer  "x2"
    t.integer  "y2"
    t.integer  "x3"
    t.integer  "y3"
    t.integer  "x4"
    t.integer  "y4"
    t.integer  "image_analysis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
