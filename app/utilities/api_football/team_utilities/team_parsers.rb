module ApiFootball
  module TeamUtility
    class TeamParsers
      attr_reader :by_league_dir, :by_team_dir

      def initialize
        root_dir = "#{Rails.root}/raw_data/json_files/epl_data/api_football"
        @by_league_dir = "#{root_dir}/teams_by_league/"
        @by_team_dir = "#{root_dir}/teams_by_id/"
      end

      # Parsers: team_by_league
      # Parses all files in directory and returns an array of data with symbolized keys
      def by_league_parser
        by_league_data = []
        target_dir = by_league_dir
        Dir.foreach(target_dir) do |file|
          next if file == '.' or file == '..'
          json_file = File.open(target_dir + file)
          parsed_file = JSON.parse(File.read(json_file))
          @team_values = parsed_file["api"]["teams"].values

        end

        @team_values.each { |v| by_league_data.push(v.deep_symbolize_keys!)}

        by_league_data
      end
    end
  end
end
