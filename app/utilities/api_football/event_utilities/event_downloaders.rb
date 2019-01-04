require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module ApiFootball
  module EventUtility
    class EventDownloaders
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /events/{fixture_id}
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def by_fixture(wod, fixture_id)
        options = {
          wod: wod,
          response: api_connection.connection.get("events/#{fixture_id}"),
          directory: "epl_data/api_football/events_by_fixture",
          filename: "#{fixture_id}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
