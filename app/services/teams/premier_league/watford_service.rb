module Teams
  module PremierLeague
    class WatfordService
      def self.team_details
        conn = ApiFootballApiService.new
        response = conn.connection.get('teams/team/38')
        JSON.parse(response)
      end

      def self.team_roster
        conn = ApiFootballApiService.new
        response = conn.connection.get('players/2018/38')
        JSON.parse(response)
      end
    end
  end
end
