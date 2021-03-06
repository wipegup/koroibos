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

ActiveRecord::Schema.define(version: 2019_07_30_143322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athletes", force: :cascade do |t|
    t.string "name"
    t.integer "sex"
    t.integer "height"
    t.integer "weight"
    t.string "team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age"
  end

  create_table "event_participations", force: :cascade do |t|
    t.bigint "athlete_id"
    t.bigint "game_id"
    t.bigint "event_id"
    t.integer "medal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_event_participations_on_athlete_id"
    t.index ["event_id"], name: "index_event_participations_on_event_id"
    t.index ["game_id"], name: "index_event_participations_on_game_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["sport_id"], name: "index_events_on_sport_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "season"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "event_participations", "athletes"
  add_foreign_key "events", "sports"
end
