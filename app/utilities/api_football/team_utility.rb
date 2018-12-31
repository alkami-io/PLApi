require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"

module ApiFootball
  module TeamUtility
    class Teams
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: teams/league/{league_id}
      def by_league(write, league_id)
        response = api_connection.connection.get("teams/league/#{league_id}")
        filename = "teams_by_league_#{league_id}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      # Endpoint: teams/team/{team_id}
      def by_id(write, team_id)
        response = api_connection.connection.get("teams/team/#{team_id}")
        filename = "teams_by_team_#{team_id}"

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      def write_to_json(filename, response)
        File.open("#{Rails.root}/raw_data/json_files/premier_league_data/api_football/teams/#{filename}.json","w") do |f|
          f.write(response)
        end
      end
    end
  end
end
