require 'api_football_api/connection_service'

module ApiFootball
  module TeamService
    class Teams
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionService.api_connection
      end

      def premier_league_teams
        response = api_connection.get('teams/league/2')
        JSON.parse(response.body)
      end
    end
  end
end
