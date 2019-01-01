require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module ApiFootball
  module TeamUtility
    class Teams
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: teams/league/{league_id}
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def by_league(wod, league_id)
        options = {
          wod: wod,
          response: api_connection.connection.get("teams/league/#{league_id}"),
          directory: "premier_league_data/api_football/teams_by_league",
          filename: "teams_by_league_#{league_id}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Endpoint: teams/team/{team_id}
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def by_id(wod, team_id)
        options = {
          wod: wod,
          response: api_connection.connection.get("teams/team/#{team_id}"),
          directory: "premier_league_data/api_football/teams_by_id",
          filename: "teams_by_id_#{team_id}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
