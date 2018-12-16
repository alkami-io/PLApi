module Teams
  module PremierLeague
    class BournemouthService
      def self.team_details
        conn = ApiFootballApiService.new
        response = conn.connection.get('teams/team/35')
        JSON.parse(response.body)
      end

      def self.team_roster
        conn = ApiFootballApiService.new
        response = conn.connection.get('players/2018/35')
        JSON.parse(response.body)
      end
    end
  end
end
