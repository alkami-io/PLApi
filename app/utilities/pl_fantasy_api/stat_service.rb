require 'pl_fantasy_api/connection_service'

module PLFantasy
  module StatService
    class Stats
      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionService.api_connection
      end

      def all_stats
        response = api_connection.get('bootstrap')
        JSON.parse(response.body)["stats"]
      end
    end
  end
end
