module ApiFootball
  module EventUtility
    class EventParsers
      attr_reader :by_fixture_dir

      def initialize
        @by_fixture_dir = "#{Rails.root}/raw_data/json_files/epl_data/api_football/events_by_fixture/"
      end

      # Parser: events_by_fixture
      # Parses all files in this directory and returns and array of events with symbolized keys
      def by_fixture_parser
        by_fixture_data = []
        target_dir = by_fixture_dir
        Dir.foreach(target_dir) do |file|
          next if file == '.' or file == '..'
          json_file = File.open(target_dir + file)
          parsed_file = JSON.parse(File.read(json_file))
          event_values = parsed_file["api"]["events"]
          event_values.each do |value|
            value[:fixture_id] = file.split("_").first.to_i
            by_fixture_data.push(value.deep_symbolize_keys!)
          end
        end

        by_fixture_data
      end
    end
  end
end
