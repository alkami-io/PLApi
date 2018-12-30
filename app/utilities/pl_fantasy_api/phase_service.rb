require 'pl_fantasy_api/connection_service'

module PLFantasy
  module PhaseService
    class Phases
      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionService.api_connection
      end

      def all_phases
        response = api_connection.get('phases/')
        JSON.parse(response.body)
      end
    end
  end
end
