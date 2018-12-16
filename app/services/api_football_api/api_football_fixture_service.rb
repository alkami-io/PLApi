require 'api_football_api/api_football_connection_service'

module ApiFootball
  module FixtureService
    class Fixtures
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionService.api_connection
      end

      def live_fixtures
        response = api_connection.get('fixtures/live')
        JSON.parse(response.body)
      end

      def fixtures_by_date(date)
        response = api_connection.get("fixtures/date/#{date}")
        JSON.parse(response.body)
      end

      def fixtures_by_league(league_id)

      end
    end
  end
end
