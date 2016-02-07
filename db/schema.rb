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

ActiveRecord::Schema.define(version: 20160204214701) do

  create_table "players", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "team",         limit: 255
    t.string   "position",     limit: 255
    t.integer  "week_1_score", limit: 4,   default: 0
    t.integer  "week_2_score", limit: 4,   default: 0
    t.integer  "week_3_score", limit: 4,   default: 0
    t.integer  "week_4_score", limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rostered_players", force: :cascade do |t|
    t.integer  "roster_id",  limit: 4
    t.integer  "player_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rosters", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "team_name",  limit: 255
    t.integer  "qb_1",       limit: 4
    t.integer  "qb_2",       limit: 4
    t.integer  "rb_1",       limit: 4
    t.integer  "rb_2",       limit: 4
    t.integer  "rb_3",       limit: 4
    t.integer  "wr_1",       limit: 4
    t.integer  "wr_2",       limit: 4
    t.integer  "wr_3",       limit: 4
    t.integer  "te_1",       limit: 4
    t.integer  "k_1",        limit: 4
    t.integer  "k_2",        limit: 4
    t.integer  "d_1",        limit: 4
    t.integer  "flex_1",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
