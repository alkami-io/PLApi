require 'api_football_api/connection_service'

module ApiFootball
  module LeagueService
    class Leagues
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionService.api_connection
      end

      def all_leagues
        response = api_connection.get('leagues')
        JSON.parse(response.body)
      end

      def league_by_id(league_id)
        response = api_connection.get("leagues/league/#{league_id}")
        JSON.parse(response.body)
      end

      def leagues_by_season(season)
        response = api_connection.get("leagues/season/#{season}")
        JSON.parse(response.body)
      end

      def leagues_by_country_season(country_name, season)
        response = api_connection.get("leagues/country/#{country_name}/#{season}")
        JSON.parse(response.body)
      end
    end
  end
end
