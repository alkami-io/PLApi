require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module ApiFootball
  module MLS
    class Seasons
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint /leagues/country/USA/2016
      # wod: writeOrDisplay - Pass "w" to Write to file or "d" to display data
      def seasons_by_year(wod, year)
        options = {
          wod: wod,
          response: api_connection.connection.get("leagues/country/USA/#{year}"),
          directory: "mls_data/api_football/seasons",
          filename: "mls_seasons_#{year}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Iterates through seasons raw data file parses and inserts
      # JSON data into DB for MLS seasons.
      def inject_seasons
        source_path = Rails.root.join('raw_data', 'json_files', 'mls_data', 'api_football', 'seasons')

        Dir.glob("#{source_path}/*.json").each do |json_file|
          file = JSON.parse(File.read(json_file))
          file.deep_symbolize_keys!
          league_info = file[:api][:leagues].values.first

          ApiFootballMlsSeason.create(
            league_id: league_info[:league_id],
            name: league_info[:name],
            country: league_info[:country],
            country_code: league_info[:country_code],
            season: league_info[:season],
            season_start: league_info[:season_start],
            season_end: league_info[:season_end],
            logo: league_info[:logo],
            flag: league_info[:flag],
            standings: league_info[:standings]
          )
        end
      end
    end
  end
end
