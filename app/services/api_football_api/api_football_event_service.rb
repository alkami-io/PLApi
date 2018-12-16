require 'api_football_api/api_football_connection_service'

module ApiFootball
  module EventService
    class Events
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionService.api_connection
      end

      def events_by_fixture(fixture_id)
        response = api_connection.get("events/#{fixture_id}")
        JSON.parse(response.body)
      end
    end
  end
end
