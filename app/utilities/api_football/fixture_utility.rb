require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"

module ApiFootball
  module FixtureUtility
    class Fixtures
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /fixtures/live
      def live(write)
        response = api_connection.connection.get('fixtures/live')
        filename = "fixtures_live_#{DateTime.current}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      # Endpoint: /fixtures/date/{date}
      # Date format "YYYY-MM-DD"
      def by_date(write, date)
        response = api_connection.connection.get("fixtures/date/#{date}")
        filename = "fixtures_by_date_#{date}_#{DateTime.current}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      # Endpoint: /fixtures/league/{league_id}
      def by_league(write, league_id)
        response = api_connection.connection.get("fixtures/league/#{league_id}")
        filename = "fixtures_by_league_#{league_id}_#{DateTime.current}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      # Endpoint: /fixtures/id/{fixture_id}
      def by_id(write, fixture_id)
        response = api_connection.connection.get("fixtures/id/#{fixture_id}")
        filename = "fixture_by_id_#{fixture_id}_#{DateTime.current}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      # Endpoint: /fixtures/team/{team_id}
      def by_team(write, team_id)
        response = api_connection.connection.get("fixtures/team/#{team_id}")
        filename = "fixtures_by_team_#{team_id}_#{DateTime.current}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      # Endpoint: /fixtures/h2h/{team_1}/{team_2}
      def h2h(write, team_one_id, team_two_id)
        response = api_connection.connection.get("fixtures/h2h/#{team_one_id}/#{team_two_id}")
        filename = "fixtures_by_h2h_#{team_one_id}_v_#{team_two_id}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      # Write to JSON if we want to save the response and not have to request it again
      def write_to_json(file_name, response)
        File.open("#{Rails.root}/raw_data/json_files/premier_league_data/api_football/api_football_#{file_name}.json","w") do |f|
          f.write(response)
        end
      end
    end
  end
end
