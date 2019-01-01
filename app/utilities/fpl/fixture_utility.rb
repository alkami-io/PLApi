require "#{Rails.root}/app/utilities/fpl/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module PLFantasy
  module FixtureUtility
    class Fixtures
      include CoreUtility::DataToJSON

      attr_reader :api_connection

      def initialize
        @api_connection = PLFantasy::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /fixtures
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def fixtures(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get("fixtures/"),
          directory: "fpl_data/pulled_data/fixtures",
          filename: "fixtures_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Endpoint: /fixtures?event={event_id}
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def fixtures_by_event(wod, event_id)
        options = {
          wod: wod,
          response: api_connection.connection.get("fixtures/?event=#{event_id}"),
          directory: "fpl_data/pulled_data/fixtures_by_event",
          filename: "fixtures_by_event_#{event_id}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
