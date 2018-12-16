require 'api_football_api/api_football_api_service'

module ApiFootball
  module LeagueService
    class Leagues
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionService.api_connection
      end

      def all_leagues
        response = api_connection.get('leagues')
        JSON.parse(response.body)
      end

      def premier_league
        response = api_connection.get('leagues/league/2')
        JSON.parse(response.body)
      end
    end
  end
end
