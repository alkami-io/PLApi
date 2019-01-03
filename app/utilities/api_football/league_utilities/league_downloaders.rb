require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module ApiFootball
  module LeagueUtility
    class LeagueDownloaders
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
    end
  end
end
