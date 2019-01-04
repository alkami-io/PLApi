class CreateApiFootballFixtures < ActiveRecord::Migration[5.2]
  def change
    create_table :api_football_fixtures do |t|
      t.integer :fixture_id
      t.string :event_timestamp
      t.datetime :event_date
      t.integer :league_id
      t.string :round
      t.integer :home_team_id
      t.integer :away_team_id
      t.string :home_team
      t.string :away_team
      t.string :match_status
      t.string :match_status_abbr
      t.integer :goals_home_team
      t.integer :goals_away_team
      t.string :halftime_score
      t.string :final_score
      t.string :penalty
      t.integer :elapsed
      t.string :first_half_start
      t.string :second_half_start

      t.timestamps
    end
  end
end
