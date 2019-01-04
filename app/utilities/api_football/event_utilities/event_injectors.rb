require "#{Rails.root}/app/utilities/api_football/event_utilities/event_parsers.rb"

module ApiFootball
  module EventUtility
    class EventInjectors
      # Injector: by_fixtures
      # Injects parsed data into the database
      def self.by_fixture
        parser_data = ApiFootball::EventUtility::EventParsers.new
        by_fixture_data = parser_data.by_fixture_parser

        by_fixture_data.each do |fixture|
          ApiFootballFixtureEvent.create(
            fixture_id: fixture[:fixture_id].to_i,
            elapsed: fixture[:elapsed].to_i,
            team_name: fixture[:teamName],
            player_first_name: parse_player_first_name(fixture[:player]),
            player_last_name: parse_player_last_name(fixture[:player]),
            event_type: fixture[:type],
            event_detail: fixture[:detail]
          )
        end
      end

      def self.parse_player_first_name(player_name)
        player_name.split(' ')[0]
      end

      def self.parse_player_last_name(player_name)
        player_name.split(' ')[1]
      end
    end
  end
end
