require "#{Rails.root}/app/utilities/pl_fantasy/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module PLFantasy
  module GameSettingUtility
    class GameSettings
      include CoreUtility::DataToJSON

      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /game-settings
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def game_settings(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get("game-settings/"),
          directory: "pl_fantasy_data/pulled_data/game_settings",
          filename: "game_settings_#{DateTime.current}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
