require "#{Rails.root}/app/utilities/api_football/team_utilities/team_parsers.rb"

module ApiFootball
  module TeamUtility
    class TeamInjectors
      # Injector: by_league
      # Injects parsed data into the database
      def self.by_league_injector
        parser_data = ApiFootball::TeamUtility::TeamParsers.new
        by_league_data = parser_data.by_league_parser

        by_league_data.each do |team|
          ApiFootballTeam.create(
            team_id: team[:team_id],
            name: team[:name],
            logo: team[:logo]
          )
        end
      end
    end
  end
end
