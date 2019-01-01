require "#{Rails.root}/app/utilities/fpl/connection_utility.rb"
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
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def elements(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get('elements/'),
          directory: "fpl_data/pulled_data/elements",
          filename: "elements_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Endpoint: /element-summary/{element_id}
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def element_summary(wod, element_id)
        options = {
          wod: wod,
          response: api_connection.connection.get("element-summary/#{element_id}"),
          directory: "fpl_data/pulled_data/element_summary",
          filename: "element_summary_#{element_id}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Endpoint: /element-types
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def element_types(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get("element-types/"),
          directory: "fpl_data/pulled_data/element_types",
          filename: "element_types_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
