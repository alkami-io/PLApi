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

ActiveRecord::Schema.define(version: 2019_01_06_175353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_football_fixture_events", force: :cascade do |t|
    t.integer "fixture_id"
    t.integer "elapsed"
    t.string "team_name"
    t.string "player_first_name"
    t.string "player_last_name"
    t.string "event_type"
    t.string "event_detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_football_fixtures", force: :cascade do |t|
    t.integer "fixture_id"
    t.string "event_timestamp"
    t.datetime "event_date"
    t.integer "league_id"
    t.string "round"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.string "home_team"
    t.string "away_team"
    t.string "match_status"
    t.string "match_status_abbr"
    t.integer "goals_home_team"
    t.integer "goals_away_team"
    t.string "halftime_score"
    t.string "final_score"
    t.string "penalty"
    t.integer "elapsed"
    t.string "first_half_start"
    t.string "second_half_start"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "api_football_lineups", force: :cascade do |t|
    t.integer "fixture_id"
    t.string "team_name"
    t.string "formation"
    t.string "manager"
    t.jsonb "starting_xi", default: "{}"
    t.jsonb "substitutes", default: "{}"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["starting_xi"], name: "index_api_football_lineups_on_starting_xi", using: :gin
  end

end
