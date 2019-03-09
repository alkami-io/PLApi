class CreateApiFootballMlsSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :api_football_mls_seasons do |t|
      t.integer :league_id
      t.string :name
      t.string :country
      t.string :country_code
      t.string :season
      t.datetime :season_start
      t.datetime :season_end
      t.string :logo
      t.string :flag
      t.boolean :standings, default: true

      t.timestamps
    end
  end
end
