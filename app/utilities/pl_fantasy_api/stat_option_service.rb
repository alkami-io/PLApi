require 'pl_fantasy_api/connection_service'

module PLFantasy
  module StatOptionService
    class StatOptions
      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionService.api_connection
      end

      def all_stat_options
        response = api_connection.get('bootstrap')
        JSON.parse(response.body)["stats_options"]
      end
    end
  end
end
