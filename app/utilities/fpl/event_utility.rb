require "#{Rails.root}/app/utilities/fpl/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module FPL
  module EventUtility
    class Events
      include CoreUtility::DataToJSON

      attr_reader :api_connection

      def initialize
        @api_connection = FPL::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /events
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def events(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get("events/"),
          directory: 'fpl_data/pulled_data/events',
          filename: "events_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
