class CreateApiFootballStats < ActiveRecord::Migration[5.2]
  def change
    create_table :api_football_stats do |t|
      t.integer :team_id
      t.integer :league_id
      t.jsonb :matches, null: true, default: {}
      t.jsonb :goals, null: true, default: {}
      t.jsonb :goals_avg, null: true, default: {}


      t.timestamps
    end

    add_index :api_football_stats, :matches, using: :gin
    add_index :api_football_stats, :goals, using: :gin
    add_index :api_football_stats, :goals_avg, using: :gin
  end
end
