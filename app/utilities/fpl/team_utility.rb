require "#{Rails.root}/app/utilities/fpl/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module PLFantasy
  module TeamUtility
    class Teams
      include CoreUtility::DataToJSON

      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /teams
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def teams(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get("teams/"),
          directory: "fpl_data/pulled_data/teams",
          filename: "teams_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
