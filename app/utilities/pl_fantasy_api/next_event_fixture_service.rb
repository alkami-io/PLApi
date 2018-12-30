require 'pl_fantasy_api/connection_service'

module PLFantasy
  module NextEventFixtureService
    class NextEventFixtures
      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionService.api_connection
      end

      def all_next_event_fixtures
        response = api_connection.get('bootstrap')
        JSON.parse(response.body)["next_event_fixtures"]
      end
    end
  end
end
