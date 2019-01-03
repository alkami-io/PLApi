class CreateApiFootballLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :api_football_leagues do |t|
      t.integer :league_id
      t.string :name
      t.string :country
      t.string :season
      t.string :season_start
      t.string :season_end
      t.string :league_logo
      t.boolean :standings

      t.timestamps
    end
  end
end
