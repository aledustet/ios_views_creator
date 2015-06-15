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

ActiveRecord::Schema.define(version: 20150613202637) do

  create_table "image_sections", force: :cascade do |t|
    t.integer  "section_id"
    t.string   "image_name"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "image_sections", ["section_id"], name: "index_image_sections_on_section_id"

  create_table "sections", force: :cascade do |t|
    t.integer  "view_id"
    t.integer  "section_index"
    t.integer  "x"
    t.integer  "y"
    t.integer  "width"
    t.integer  "height"
    t.integer  "section_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "sections", ["view_id"], name: "index_sections_on_view_id"

  create_table "text_sections", force: :cascade do |t|
    t.integer  "section_id"
    t.text     "content"
    t.string   "font"
    t.integer  "font_size"
    t.integer  "red"
    t.integer  "green"
    t.integer  "blue"
    t.integer  "alignment"
    t.boolean  "scrollable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "text_sections", ["section_id"], name: "index_text_sections_on_section_id"

  create_table "views", force: :cascade do |t|
    t.integer  "view_index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
