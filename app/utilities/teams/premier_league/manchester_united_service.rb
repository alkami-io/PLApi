module Teams
  module PremierLeague
    class ManchesterUnitedService
      def self.team_details
        conn = ApiFootballApiService.new
        response = conn.connection.get('teams/team/33')
        JSON.parse(response.body)
      end

      def self.team_roster
        conn = ApiFootballApiService.new
        response = conn.connection.get('players/2018/33')
        JSON.parse(response.body)
      end
    end
  end
end
