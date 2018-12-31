require "#{Rails.root}/app/utilities/pl_fantasy/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module PLFantasy
  module EventUtility
    class Events
      include CoreUtility::DataToJSON

      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /events
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def events(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get("events/"),
          directory: 'pl_fantasy_data/pulled_data/events',
          filename: "events_#{DateTime.current}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
