class CreateApiFootballTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :api_football_teams do |t|
      t.integer :team_id
      t.string :name
      t.string :logo

      t.timestamps
    end
  end
end
