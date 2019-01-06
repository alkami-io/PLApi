module ApiFootball
  module LineupUtility
    class LineupParsers
      attr_reader :by_fixture_dir

      def initialize
        root_dir = "#{Rails.root}/raw_data/json_files/epl_data/api_football"
        @by_fixture_dir = "#{root_dir}/lineups_by_fixture/"
      end

      # Parsers: lineups_by_fixture
      # Parses all files in this directory and returns and array of leagues with symbolized keys
      def by_fixture_parser
        by_fixture_data = []
        target_dir = by_fixture_dir
        Dir.foreach(target_dir) do |file|
          next if file == '.' or file == '..'
          json_file = File.open(target_dir + file)
          parsed_file = JSON.parse(File.read(json_file))
          lineup_values = parsed_file["api"]["lineUps"]
          lineup_values.each do |value|
            value[1][:fixture_id] = file.split("_").first.to_i
            value[1][:team_name] = value[0]
            by_fixture_data.push(value[1].deep_symbolize_keys!)
          end
        end

        by_fixture_data
      end
    end
  end
end
