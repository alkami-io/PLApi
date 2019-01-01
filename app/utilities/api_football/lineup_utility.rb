require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module ApiFootball
  module LineupUtility
    class Lineups
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /lineups/{fixture_id}
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def by_fixture(wod, fixture_id)
        options = {
          wod: wod,
          response: api_connection.connection.get("lineups/#{fixture_id}"),
          directory: "premier_league_data/api_football/lineups_by_fixture",
          filename: "lineups_by_fixture_#{fixture_id}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
