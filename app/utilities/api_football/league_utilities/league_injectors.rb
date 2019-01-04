require "#{Rails.root}/app/utilities/api_football/league_utilities/league_parsers.rb"

module ApiFootball
  module LeagueUtility
    class LeagueInjectors
      # Injector: by_country_season
      # Injects the parsed data into the database
      def self.by_country_season_injector
        parser_data = ApiFootball::LeagueUtility::LeagueParsers.new
        by_country_season_data = parser_data.by_country_season_parser

        by_country_season_data.each do |league|
          ApiFootballLeague.create(
            league_id: league[:league_id].to_i,
            name: league[:name],
            country: league[:country],
            season: league[:season],
            season_start: league[:season_start],
            season_end: league[:season_end],
            league_logo: league[:logo],
            standings: league[:standings]
          )
        end
      end
    end
  end
end
