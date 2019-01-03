require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module ApiFootball
  module LeagueUtility
    class Leagues
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /leagues
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def leagues(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get('leagues'),
          directory: "epl_data/api_football/leagues",
          filename: "leagues_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Endpoint: /leagues/league/{league_id}
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def by_id(wod, league_id)
        options = {
          wod: wod,
          response: api_connection.connection.get("leagues/league/#{league_id}"),
          directory: "epl_data/api_football/leagues_by_id",
          filename: "leagues_by_id_#{league_id}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Endpoint: /leagues/season/{season}
      # Season: year
      def by_season(wod, season)
        options = {
          wod: wod,
          response: api_connection.connection.get("leagues/season/#{season}"),
          directory: "epl_data/api_football/leagues_by_season",
          filename: "leagues_by_season_#{season}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Endpoint: /leagues/country/{country_name}/{season}
      # Country Name: String
      # Season: year
      def by_country_season(wod, country_name, season)
        options = {
          wod: wod,
          response: api_connection.connection.get("leagues/country/#{country_name}/#{season}"),
          directory: "epl_data/api_football/leagues_by_country_season",
          filename: "leagues_by_country_season_#{country_name}_#{season}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Parser: leagues_by_country_season
      # Parses all files in this directory and returns an array of leagues with symbolized keys
      def by_country_season_parser
        by_country_season_data = []
        target_dir = "#{Rails.root}/raw_data/json_files/epl_data/api_football/leagues_by_country_season/"
        Dir.foreach(target_dir) do |file|
          next if file == '.' or file == '..'
          json_file = File.open(target_dir + file)
          parsed_file = JSON.parse(File.read(json_file))
          league_values = parsed_file["api"]["leagues"].values
          league_values.each {|v| by_country_season_data.push(v.deep_symbolize_keys!)}
        end

        by_country_season_data
      end

      # Injector: by_country_season
      # Injects the parsed data into the database
      def by_country_season_injector
        by_country_season_data = by_country_season_parser


      end


    end
  end
end
