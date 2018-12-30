require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"

module ApiFootball
  module LeagueUtility
    class Leagues
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /leagues
      def all_leagues(write)
        response = api_connection.connection.get('leagues')
        filename = "leagues_#{DateTime.current}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      # Endpoint: /leagues/league/{league_id}
      def by_id(write, league_id)
        response = api_connection.connection.get("leagues/league/#{league_id}")
        filename = "leagues_by_id_#{league_id}_#{DateTime.current}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      # Endpoint: /leagues/season/{season}
      # Season: year
      def by_season(write, season)
        response = api_connection.connection.get("leagues/season/#{season}")
        filename = "leagues_by_season_#{season}_#{DateTime.current}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      # Endpoint: /leagues/country/{country_name}/{season}
      # Country Name: String
      # Season: year
      def by_country_season(write, country_name, season)
        response = api_connection.connection.get("leagues/country/#{country_name}/#{season}")
        filename = "leagues_by_country_season_#{country_name}_#{season}_#{DateTime.current}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      def write_to_json(filename, response)
        File.open("#{Rails.root}/raw_data/json_files/premier_league_data/api_football/leagues/#{filename}.json","w") do |f|
          f.write(response)
        end
      end
    end
  end
end
