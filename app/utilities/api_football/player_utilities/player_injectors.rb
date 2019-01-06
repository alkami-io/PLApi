require "#{Rails.root}/app/utilities/api_football/player_utilities/player_parsers.rb"

module ApiFootball
  module PlayerUtility
    class PlayerInjectors
      # Injector: by_season_team
      # Injects parsed data into the database
      def self.by_season_team_injector
        parser_data = ApiFootball::PlayerUtility::PlayerParsers.new
        by_season_team_data = parser_data.by_season_team_parser

        by_season_team_data.each do |player|
          ApiFootballPlayer.create(
            team_id: player[:team_id],
            number: player[:number].to_i,
            player_name: player[:player],
            season: player[:season],
            coaches: player[:coaches]
          )
        end
      end
    end
  end
end
