module Teams
  module PremierLeague
    class SouthhamptonService
      def self.team_details
        conn = ApiFootballApiService.new
        response = conn.connection.get('teams/team/41')
        JSON.parse(response)
      end

      def self.team_roster
        conn = ApiFootballApiService.new
        response = conn.connection.get('players/2018/41')
        JSON.parse(response)
      end
    end
  end
end
