require 'api_football_api/api_football_connection_service'

module ApiFootball
  module StandingService
    class Standings
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionService.api_connection
      end

      def standings_by_league(league_id)
        response = api_connection.get("standings/#{league_id}")
        JSON.parse(response.body)
      end
    end
  end
end
