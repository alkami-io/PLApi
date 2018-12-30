require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"

module ApiFootball
  module StandingUtility
    class Standings
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: standings/{league_id}
      def by_league(write, league_id)
        response = api_connection.connection.get("standings/#{league_id}")
        filename = "standings_by_league_#{league_id}_#{DateTime.current}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      def write_to_json(filename, response)
        File.open("#{Rails.root}/raw_data/json_files/premier_league_data/api_football/standings/#{filename}.json","w") do |f|
          f.write(response)
        end
      end
    end
  end
end
