require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

module ApiFootball
  module FixtureUtility
    class Fixtures
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /fixtures/live
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def live(wod)
        options = {
          wod: wod,
          response: api_connection.connection.get('fixtures/live'),
          directory: "epl_data/api_football/fixtures_live",
          filename: "live_fixtures_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Endpoint: /fixtures/date/{date}
      # Date format "YYYY-MM-DD"
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def by_date(wod, date)
        options = {
          wod: wod,
          response: api_connection.connection.get("fixtures/date/#{date}"),
          directory: "epl_data/api_football/fixtures_by_date",
          filename: "fixtures_by_date_#{date}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Endpoint: /fixtures/league/{league_id}
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def by_league(wod, league_id)
        options = {
          wod: wod,
          response: api_connection.connection.get("fixtures/league/#{league_id}"),
          directory: "epl_data/api_football/fixtures_by_league",
          filename: "fixtures_by_league_#{league_id}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Endpoint: /fixtures/id/{fixture_id}
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def by_id(wod, fixture_id)
        options = {
          wod: wod,
          response: api_connection.connection.get("fixtures/id/#{fixture_id}"),
          directory: "epl_data/api_football/fixtures_by_id",
          filename: "fixtures_by_id_#{fixture_id}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Endpoint: /fixtures/team/{team_id}
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def by_team(wod, team_id)
        options = {
          wod: wod,
          response: api_connection.connection.get("fixtures/team/#{team_id}"),
          directory: "epl_data/api_football/fixtures_by_team",
          filename: "fixtures_by_team_#{team_id}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end

      # Endpoint: /fixtures/h2h/{team_1}/{team_2}
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def h2h(wod, team_one_id, team_two_id)
        options = {
          wod: wod,
          response: api_connection.connection.get("fixtures/h2h/#{team_one_id}/#{team_two_id}"),
          directory: "epl_data/api_football/fixtures_h2h",
          filename: "fixtures_by_h2h_#{team_one_id}_v_#{team_two_id}_#{DateTime.current.strftime("%C%y-%m-%d")}"
        }

        CoreUtility::DataToJSON.write_or_display_data(options)
      end
    end
  end
end
