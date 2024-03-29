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

ActiveRecord::Schema.define(version: 20141010193009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: true do |t|
    t.integer  "feed_id",    null: false
    t.string   "title"
    t.string   "url",        null: false
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["feed_id", "created_at"], name: "index_entries_on_feed_id_and_created_at", using: :btree

  create_table "feeds", force: true do |t|
    t.string "title",    null: false
    t.string "url",      null: false
    t.string "feed_url", null: false
    t.string "uid",      null: false
  end

  add_index "feeds", ["feed_url"], name: "index_feeds_on_feed_url", unique: true, using: :btree
  add_index "feeds", ["uid"], name: "index_feeds_on_uid", unique: true, using: :btree

  create_table "identities", force: true do |t|
    t.string "uid", null: false
  end

  add_index "identities", ["uid"], name: "index_identities_on_uid", unique: true, using: :btree

end
