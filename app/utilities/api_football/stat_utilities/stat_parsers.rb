module ApiFootball
  module StatUtility
    class StatParsers
      attr_reader :by_league_team_dir, :by_league_team_date_dir

      def initialize
        root_dir = "#{Rails.root}/raw_data/json_files/epl_data/api_football"
        @by_league_team_dir = "#{root_dir}/stats_by_league_team/"
        @by_league_team_date_dir = "#{root_dir}/stats_by_league_team_date/"
      end

      # Parsers: stats_by_league_team
      # Parses all files in directory and returns an array of data with symbolized keys
      def by_league_team_parser
        by_league_team_data = []
        target_dir = by_league_team_dir
        Dir.foreach(target_dir) do |file|
          next if file == '.' or file == '..'
          json_file = File.open(target_dir + file)
          parsed_file = JSON.parse(File.read(json_file))
          stat_values = parsed_file["api"]["stats"]
          stat_values[:league_id] = file.split("_")[1].to_i
          stat_values[:team_id] = file.split("_")[3].to_i
          by_league_team_data.push(stat_values.deep_symbolize_keys!)
        end

        by_league_team_data
      end
    end
  end
end
