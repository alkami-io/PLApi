require 'pl_fantasy_api/connection_service'

module PLFantasy
  module TeamService
    class Teams
      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionService.api_connection
      end

      def all_teams
        response = api_connection.get('teams/')
        JSON.parse(response.body)
      end
    end
  end
end
