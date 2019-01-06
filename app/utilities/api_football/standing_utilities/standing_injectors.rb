require "#{Rails.root}/app/utilities/api_football/standing_utilities/standing_parsers.rb"

module ApiFootball
  module StandingUtility
    class StandingInjectors
      # Injector: by_league
      # Injects the parsed data into the database
      def self.by_league_injector
        parser_data = ApiFootball::StandingUtility::StandingParsers.new
        by_league_data = parser_data.by_league_parser

        by_league_data.each do |standing|
          ApiFootballStanding.create(
            league_id: standing[:league_id],
            team_id: standing[:team_id],
            team_name: standing[:teamName],
            matches_play: standing[:play],
            matches_win: standing[:win],
            matches_draw: standing[:draw],
            matches_lose: standing[:lose],
            goals_for: standing[:goalsFor],
            goals_against: standing[:goalsAgainst],
            goals_diff: standing[:goalsDiff],
            points: standing[:points],
            rank: standing[:rank]
          )
        end
      end
    end
  end
end
