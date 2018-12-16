require 'api_football_api/api_football_connection_service'

module ApiFootball
  module LineupService
    class Lineups
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionService.api_connection
      end

      def lineups_by_fixture(fixture_id)
        response = api_connection.get("lineups/#{fixture_id}")
        JSON.parse(response.body)
      end
    end
  end
end
