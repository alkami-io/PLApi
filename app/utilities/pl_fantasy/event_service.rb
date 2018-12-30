require 'pl_fantasy_api/connection_service'

module PLFantasy
  module EventService
    class Events
      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionService.api_connection
      end

      def all_events
        response = api_connection.get('events/')
        JSON.parse(response.body)
      end
    end
  end
end
