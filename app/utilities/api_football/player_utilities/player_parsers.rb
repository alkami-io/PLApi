module ApiFootball
  module PlayerUtility
    class PlayerParsers
      attr_reader :by_season_team_dir

      def initialize
        root_dir = "#{Rails.root}/raw_data/json_files/epl_data/api_football"
        @by_season_team_dir = "#{root_dir}/players_by_season_team/"
      end

      # Parsers: players_by_season_team
      # Parses all files in directory and returns array of data with symbolized keys
      def by_season_team_parser
        by_season_team_data = []
        target_dir = by_season_team_dir
        Dir.foreach(target_dir) do |file|
          next if file == '.' or file == '..'
          json_file = File.open(target_dir + file)
          parsed_file = JSON.parse(File.read(json_file))
          player_values = parsed_file["api"]["players"]

          player_values.each do |value|
            # Add team_id to parsed value
            value[:team_id] = file.split("_")[0].to_i
            # Add season to parsed value
            value[:season] = file.split("_")[1].to_i
            # Add coaches to parsed value
            value[:coaches] = parsed_file["api"]["coachs"] # sic (as spelled in API)
            by_season_team_data.push(value.deep_symbolize_keys!)
          end
        end

        by_season_team_data
      end
    end
  end
end
