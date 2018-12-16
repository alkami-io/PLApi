require 'pl_fantasy_api/connection_service'

module PLFantasy
  module GameSettingService
    class GameSettings
      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionService.api_connection
      end

      def all_game_settings
        response = api_connection.get('game-settings/')
        JSON.parse(response.body)
      end
    end
  end
end
