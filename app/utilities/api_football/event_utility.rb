require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"

module ApiFootball
  module EventUtility
    class Events
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /events/{fixture_id}
      def by_fixture(write, fixture_id)
        response = api_connection.connection.get("events/#{fixture_id}")
        filename = "events_by_fixture_#{fixture_id}_#{DateTime.current}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      def write_to_json(filename, response)
        File.open("#{Rails.root}/raw_data/json_files/premier_league_data/api_football/events/#{filename}.json","w") do |f|
          f.write(response)
        end
      end
    end
  end
end