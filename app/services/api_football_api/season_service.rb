require 'api_football_api/connection_service'

module ApiFootball
  module SeasonService
    class Seasons
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionService.api_connection
      end

      def all_seasons
        response = api_connection.get('seasons')
        JSON.parse(response.body)
      end

      def current_season
        # hold if needed
      end

      def last_season
        # hold if needed
      end
    end
  end
end
