class CreateApiFootballLineups < ActiveRecord::Migration[5.2]
  def change
    create_table :api_football_lineups do |t|
      t.integer :fixture_id
      t.string :team_name
      t.string :formation
      t.string :manager
      t.jsonb :starting_xi, null: true, default: '{}'
      t.jsonb :substitutes, null: true, default: '{}'

      t.timestamps
    end

    add_index  :api_football_lineups, :starting_xi, using: :gin
  end
end
