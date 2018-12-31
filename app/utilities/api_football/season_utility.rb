require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"

module ApiFootball
  module SeasonService
    class Seasons
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /seasons
      def all_seasons(write)
        response = api_connection.connection.get('seasons')
        filename = "all_seasons"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      def write_to_json(filename, response)
        File.open("#{Rails.root}/raw_data/json_files/premier_league_data/api_football/seasons/#{filename}.json","w") do |f|
          f.write(response)
        end
      end
    end
  end
end
