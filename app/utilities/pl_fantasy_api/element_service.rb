require 'pl_fantasy_api/connection_service'

module PLFantasy
  module ElementService
    class Elements
      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionService.api_connection
      end

      def all_elements
        response = api_connection.get('elements/')
        JSON.parse(response.body)
      end
    end
  end
end
