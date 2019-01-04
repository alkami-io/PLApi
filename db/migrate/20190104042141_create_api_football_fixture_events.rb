class CreateApiFootballFixtureEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :api_football_fixture_events do |t|
      t.integer :fixture_id
      t.integer :elapsed
      t.string :team_name
      t.string :player_first_name
      t.string :player_last_name
      t.string :event_type
      t.string :event_detail

      t.timestamps
    end
  end
end
