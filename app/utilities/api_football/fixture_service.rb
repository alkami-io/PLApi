require 'api_football_api/connection_service'

module ApiFootball
  module FixtureService
    class Fixtures
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionService.api_connection
      end

      def live_fixtures
        response = api_connection.get('fixtures/live')
        JSON.parse(response.body)
      end

      def fixtures_by_date(date)
        response = api_connection.get("fixtures/date/#{date}")
        JSON.parse(response.body)
      end

      def fixtures_by_league(league_id)
        response = api_connection.get("fixtures/league/#{league_id}")
        JSON.parse(response.body)
      end

      def fixtures_by_id(fixture_id)
        response = api_connection.get("fixtures/id/#{fixture_id}")
        JSON.parse(response.body)
      end

      def fixtures_by_team(team_id)
        response = api_connection.get("fixtures/team/#{team_id}")
        JSON.parse(response.body)
      end

      def fixtures_h2h(team_one_id, team_two_id)
        response = api_connection.get("fixtures/h2h/#{team_one_id}/#{team_two_id}")
        JSON.parse(response.body)
      end
    end
  end
end
