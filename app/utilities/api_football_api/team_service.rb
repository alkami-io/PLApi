require 'api_football_api/connection_service'

module ApiFootball
  module TeamService
    class Teams
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionService.api_connection
      end

      def teams_by_league(league_id)
        response = api_connection.get("teams/league/#{league_id}")
        JSON.parse(response.body)
      end

      def teams_by_id(team_id)
        response = api_connection.get("teams/team/#{team_id}")
        JSON.parse(response.body)
      end
    end
  end
end
