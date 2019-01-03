require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

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
      # wod: WriteOrDisplay Pass "w" to Write to File or "d" to Display data
      def by_league_team(wod, options={})
        if options[:date].nil?
          opts = {
            wod: wod,
            response: api_connection.connection.get("statistics/#{options[:league_id]}/#{options[:team_id]}"),
            directory: "epl_data/api_football/stats_by_league_team",
            filename: "statistics_by_league_#{options[:league_id]}_team_#{options[:team_id]}_#{DateTime.current.strftime("%C%y-%m-%d")}"
          }
        else
          opts = {
            wod: wod,
            response: api_connection.connection.get("statistics/#{options[:league_id]}/#{options[:team_id]}/#{options[:date]}"),
            directory: "epl_data/api_football/stats_by_league_team_date",
            filename: "statistics_by_league_#{options[:league_id]}_team_#{options[:team_id]}_on_#{options[:date]}_#{DateTime.current.strftime("%C%y-%m-%d")}"
          }
        end

        CoreUtility::DataToJSON.write_or_display_data(opts)
      end
    end
  end
end
