require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"

module ApiFootball
  module StatUtility
    class Stats
      attr_reader :api_connection

      def initialize
        @api_connection = ApiFootball::ConnectionUtility::ApiConnection.new
      end

      # Endpoint: /statistics/{league_id}/{team_id}
      # or
      # Endpoint: /statistics/{league_id}/{team_id}/{date}
      # date: 2018-12-29
      def by_league_team(write, options={})
        if options[:date].nil?
          response = api_connection.connection.get("statistics/#{options[:league_id]}/#{options[:team_id]}")
          filename = "statistics_by_league_#{options[:league_id]}_team_#{options[:team_id]}"
        else
          response = api_connection.connection.get("statistics/#{options[:league_id]}/#{options[:team_id]}/#{options[:date]}")
          filename = "statistics_by_league_#{options[:league_id]}_team_#{options[:team_id]}_on_#{options[:date]}"
        end

        write == true ? write_to_json(filename, response.body) : JSON.parse(response.body)
      end

      def write_to_json(filename, response)
        File.open("#{Rails.root}/raw_data/json_files/premier_league_data/api_football/stats/#{filename}.json","w") do |f|
          f.write(response)
        end
      end
    end
  end
end
