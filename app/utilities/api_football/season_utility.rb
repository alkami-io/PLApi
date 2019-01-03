require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module ApiFootball
  module SeasonService
    class Seasons
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /seasons
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def seasons(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get('seasons'),
          directory: "epl_data/api_football/seasons",
          filename: "seasons_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
