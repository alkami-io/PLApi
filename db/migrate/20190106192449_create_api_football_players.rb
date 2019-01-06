class CreateApiFootballPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :api_football_players do |t|
      t.integer :team_id
      t.integer :number
      t.string :player_name
      t.string :season
      t.jsonb :coaches, null: true, default: {}

      t.timestamps
    end

    add_index :api_football_players, :coaches, using: :gin
  end
end
