require 'pl_fantasy_api/connection_service'

module PLFantasy
  module ElementTypeService
    class ElementTypes
      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionService.api_connection
      end

      def all_element_types
        response = api_connection.get('element-types/')
        JSON.parse(response.body)
      end
    end
  end
end
