require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module ApiFootball
  module PlayerUtility
    class Players
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /players/{season}/{team_id}
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def by_season_team(wod, season, team_id)
        options = {
          wod: wod,
          response: api_connection.connection.get("players/#{season}/#{team_id}"),
          directory: "premier_league_data/api_football/players_by_season_team",
          filename: "players_by_season_#{season}_team_#{team_id}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
