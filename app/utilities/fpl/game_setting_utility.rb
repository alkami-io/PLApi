require "#{Rails.root}/app/utilities/fpl/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module FPL
  module GameSettingUtility
    class GameSettings
      include CoreUtility::DataToJSON

      attr_reader :api_connection

      def initialize
        @api_connection = FPL::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /game-settings
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def game_settings(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get("game-settings/"),
          directory: "fpl_data/pulled_data/game_settings",
          filename: "game_settings_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
