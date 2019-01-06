module ApiFootball
  module StandingUtility
    class StandingParsers
      attr_reader :by_league_dir

      def initialize
        root_dir = "#{Rails.root}/raw_data/json_files/epl_data/api_football"
        @by_league_dir = "#{root_dir}/standings_by_league/"
      end

      # Parsers: standing_by_league
      # Parses all files in this directory and returns an array of data with symbolized keys
      def by_league_parser
        by_league_data = []
        target_dir = by_league_dir
        Dir.foreach(target_dir) do |file|
          next if file == '.' or file == '..'
          json_file = File.open(target_dir + file)
          parsed_file = JSON.parse(File.read(json_file))
          standing_values = parsed_file["api"]["standings"]
          standing_values.each do |value|
            value[1][:rank] = value[0]
            by_league_data.push(value[1].deep_symbolize_keys!)
          end
        end

        by_league_data
      end
    end
  end
end
