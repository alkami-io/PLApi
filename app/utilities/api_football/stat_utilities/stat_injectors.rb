require "#{Rails.root}/app/utilities/api_football/stat_utilities/stat_parsers.rb"

module ApiFootball
  module StatUtility
    class StatInjectors
      # Injector: by_league_team
      # Injects parsed data into the database
      def self.by_league_team_injector
        parser_data = ApiFootball::StatUtility::StatParsers.new
        by_league_team_data = parser_data.by_league_team_parser

        by_league_team_data.each do |stat|
          ApiFootballStat.create(
            team_id: stat[:team_id],
            league_id: stat[:league_id],
            matches: stat[:matchs],
            goals: stat[:goals],
            goals_avg: stat[:goalsAvg]
          )
        end
      end
    end
  end
end
