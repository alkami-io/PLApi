require "#{Rails.root}/app/utilities/pl_fantasy/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module PLFantasy
  module ElementUtility
    class Elements
      include CoreUtility::DataToJSON

      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /elements
      # wod: Write (to file) or Display (to page)
      def elements(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get('elements/'),
          directory: "pl_fantasy_data/pulled_data/elements",
          filename: "elements_all_#{DateTime.current}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Endpoint: /element-summary/{element_id}
      # wod: Write (to file) or Display (to page)
      def element_summary(wod, element_id)
        options = {
          wod: wod,
          response: api_connection.connection.get("element-summary/#{element_id}"),
          directory: "pl_fantasy_data/pulled_data/elements",
          filename: "element_summary_#{element_id}_#{DateTime.current}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Endpoint: /element-types
      # wod: Write (to file) or Display (to page)
      def element_types(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get("element-types/"),
          directory: "pl_fantasy_data/pulled_data/elements",
          filename: "element_types_#{DateTime.current}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
