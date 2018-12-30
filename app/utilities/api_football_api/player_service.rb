require 'api_football_api/connection_service'

module ApiFootball
  module PlayerService
    class Players
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionService.api_connection
      end

      def players_by_season_team(season, team_id)
        response = api_connection.get("players/#{season}/#{team_id}")
        JSON.parse(response.body)
      end
    end
  end
end
