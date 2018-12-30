require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"

module ApiFootball
  module FixtureUtility
    class Fixtures
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /fixtures/live
      def live
        response = api_connection.connection.get('fixtures/live')
        JSON.parse(response.body)
      end

      # Endpoint: /fixtures/date/{date}
      # Date format "YYYY-MM-DD"
      def by_date(date)
        response = api_connection.connection.get("fixtures/date/#{date}")
        JSON.parse(response.body)
      end

      # Endpoint: /fixtures/league/{league_id}
      def by_league(league_id)
        response = api_connection.connection.get("fixtures/league/#{league_id}")
        JSON.parse(response.body)
      end

      # Endpoint: /fixtures/id/{fixture_id}
      def by_id(fixture_id)
        response = api_connection.connection.get("fixtures/id/#{fixture_id}")
        JSON.parse(response.body)
      end

      # Endpoint: /fixtures/team/{team_id}
      def by_team(team_id)
        response = api_connection.connection.get("fixtures/team/#{team_id}")
        JSON.parse(response.body)
      end

      # Endpoint: /fixtures/h2h/{team_1}/{team_2}
      def h2h(team_one_id, team_two_id)
        response = api_connection.connection.get("fixtures/h2h/#{team_one_id}/#{team_two_id}")
        JSON.parse(response.body)
      end
    end
  end
end
