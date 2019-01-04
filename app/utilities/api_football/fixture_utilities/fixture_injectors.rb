require "#{Rails.root}/app/utilities/api_football/fixture_utilities/fixture_parsers.rb"

module ApiFootball
  module FixtureUtility
    class FixtureInjectors
      # Injector: by_date
      # Injects Parsed data into database
      def self.by_date_injector
        parser_data = ApiFootball::FixtureUtility::FixtureParsers.new
        by_date_data = parser_data.by_date

        by_date_data.each do |fixture|
          create_fixture(fixture)
        end
      end

      # Injector: by_id
      # Injects Parsed data into database
      def self.by_id_injector
        parser_data = ApiFootball::FixtureUtility::FixtureParsers.new
        by_id_data = parser_data.by_id

        by_id_data.each do |fixture|
          create_fixture(fixture)
        end
      end

      # Injector: by_league
      # Injects Parsed data into database
      def self.by_league_injector
        parser_data = ApiFootball::FixtureUtility::FixtureParsers.new
        by_league_data = parser_data.by_league

        by_league_data.each do |fixture|
          create_fixture(fixture)
        end
      end

      # Injector: by_team
      # Injects Parsed data into database
      def self.by_team_injector
        parser_data = ApiFootball::FixtureUtility::FixtureParsers.new
        by_team_data = parser_data.by_team

        by_team_data.each do |fixture|
          create_fixture(fixture)
        end
      end

      # Injector: by_h2h
      # Injects Parsed data into database
      def self.by_h2h_injector
        # Implement later. No current data in directory
      end

      # Injector: live
      # Injects Parsed data into database
      def self.live_injector
        parser_data = ApiFootball::FixtureUtility::FixtureParsers.new
        live_data = parser_data.by_team

        live_data.each do |fixture|
          create_fixture(fixture)
        end
      end

      def self.create_fixture(fixture)
        ApiFootballFixture.create(
          fixture_id: fixture[:fixture_id],
          event_timestamp: fixture[:event_timestamp],
          event_date: fixture[:event_date],
          league_id: fixture[:league_id].to_i,
          round: fixture[:round],
          home_team_id: fixture[:homeTeam_id].to_i,
          home_team: fixture[:homeTeam],
          away_team_id: fixture[:awayTeam_id].to_i,
          away_team: fixture[:awayTeam],
          match_status: fixture[:status],
          match_status_abbr: fixture[:statusShort],
          goals_home_team: fixture[:goalsHomeTeam],
          goals_away_team: fixture[:goalsAwayTeam],
          halftime_score: fixture[:halftime_score],
          final_score: fixture[:final_score],
          penalty: fixture[:penalty],
          elapsed: fixture[:elapsed].to_i,
          first_half_start: fixture[:firstHalfStart],
          second_half_start: fixture[:secondHalfStart]
        )
      end
    end
  end
end
