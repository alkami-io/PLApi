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

ActiveRecord::Schema.define(version: 2019_01_03_035251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_football_leagues", force: :cascade do |t|
    t.integer "league_id"
    t.string "name"
    t.string "country"
    t.string "season"
    t.string "season_start"
    t.string "season_end"
    t.string "league_logo"
    t.boolean "standings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
