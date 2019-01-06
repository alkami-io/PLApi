class CreateApiFootballStandings < ActiveRecord::Migration[5.2]
  def change
    create_table :api_football_standings do |t|
      t.integer :league_id
      t.integer :team_id
      t.string :team_name
      t.integer :matches_play
      t.integer :matches_win
      t.integer :matches_draw
      t.integer :matches_lose
      t.integer :goals_for
      t.integer :goals_against
      t.integer :goals_diff
      t.integer :points
      t.integer :rank

      t.timestamps
    end
  end
end
