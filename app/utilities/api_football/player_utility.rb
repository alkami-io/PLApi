require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"

module ApiFootball
  module PlayerUtility
    class Players
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /players/{season}/{team_id}
      def by_season_team(write, season, team_id)
        response = api_connection.connection.get("players/#{season}/#{team_id}")
        filename = "players_by_season_#{season}_team_#{team_id}_#{DateTime.current}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      def write_to_json(filename, response)
        File.open("#{Rails.root}/raw_data/json_files/premier_league_data/api_football/players/#{filename}.json","w") do |f|
          f.write(response)
        end
      end
    end
  end
end
