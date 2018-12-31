module Leagues
  class PremierLeagueService
    def self.league_details
      connection = ApiFootballApiService.new
      connection.premier_league
    end

    def self.premier_league_teams
      connection = ApiFootballApiService.new
      connection.premier_league_teams
    end
  end
end
