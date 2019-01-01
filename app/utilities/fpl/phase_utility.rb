require "#{Rails.root}/app/utilities/fpl/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module PLFantasy
  module PhaseUtility
    class Phases
      include CoreUtility::DataToJSON

      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /phases
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def phases(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get("phases/"),
          directory: "fpl_data/pulled_data/phases",
          filename: "phases_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
