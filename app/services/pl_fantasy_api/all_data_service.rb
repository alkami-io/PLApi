require 'pl_fantasy_api/connection_service'

module PLFantasy
  module AllDataService
    class AllData
      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionService.api_connection
      end

      def all_data
        response = api_connection.get('bootstrap')
        JSON.parse(response.body)
      end
    end
  end
end
