require 'api_football_api/connection_service'

module ApiFootball
  module StatService
    class Stats
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionService.api_connection
      end

      def stats_by_league_team(options={})
        if options[:date].nil?
          response = api_connection.get("statistics/#{options[:league_id]}/#{options[:team_id]}")
        else
          response = api_connection.get("statistics/#{options[:league_id]}/#{options[:team_id]}/#{options[:date]}")
        end

        JSON.parse(response.body)
      end
    end
  end
end
