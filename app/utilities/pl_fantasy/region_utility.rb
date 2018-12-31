require "#{Rails.root}/app/utilities/pl_fantasy/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module PLFantasy
  module RegionUtility
    class Regions
      include CoreUtility::DataToJSON

      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /region
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def regions(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get("region/"),
          directory: "pl_fantasy_data/pulled_data/regions",
          filename: "regions_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
