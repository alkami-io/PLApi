require "#{Rails.root}/app/utilities/api_football/lineup_utilities/lineup_parsers.rb"

module ApiFootball
  module LineupUtility
    class LineupInjectors
      # Injector: by_fixture
      # Injects the parsed data into the database
      def self.by_fixture_injector
        parser_data = ApiFootball::LineupUtility::LineupParsers.new
        by_fixture_data = parser_data.by_fixture_parser

        by_fixture_data.each do |lineup|
          ApiFootballLineup.create(
            fixture_id: lineup[:fixture_id],
            team_name: lineup[:team_name],
            formation: lineup[:formation],
            manager: lineup[:coach],
            starting_xi: lineup[:startXI],
            substitutes: lineup[:substitutes]
          )
        end
      end
    end
  end
end
