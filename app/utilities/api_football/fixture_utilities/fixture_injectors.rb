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
end

{:fixture_id=>"260", :event_timestamp=>"1546104600", :event_date=>"2018-12-29T17:30:00+00:00", :league_id=>"2", :round=>"Premier League - 20", :homeTeam_id=>"40", :awayTeam_id=>"42", :homeTeam=>"Liverpool", :awayTeam=>"Arsenal", :status=>"Match Finished", :statusShort=>"FT", :goalsHomeTeam=>"5", :goalsAwayTeam=>"1", :halftime_score=>"4 - 1", :final_score=>"5 - 1", :penalty=>nil, :elapsed=>"90", :firstHalfStart=>"1546104600", :secondHalfStart=>"1546108200"}
