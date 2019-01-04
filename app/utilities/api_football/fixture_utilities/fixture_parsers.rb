module ApiFootball
  module FixtureUtility
    class FixtureParsers
      attr_reader :by_date_dir,
                  :by_id_dir,
                  :by_league_dir,
                  :by_team_dir,
                  :h2h_dir,
                  :live_dir

      def initialize
        root_dir = "#{Rails.root}/raw_data/json_files/epl_data/api_football"
        @by_date_dir = "#{root_dir}/fixtures_by_date/"
        @by_id_dir = "#{root_dir}/fixtures_by_id/"
        @by_league_dir = "#{root_dir}/fixtures_by_league/"
        @by_team_dir = "#{root_dir}/fixtures_by_team/"
        @h2h_dir = "#{root_dir}/fixtures_h2h/"
        @live_dir = "#{root_dir}/fixtures_live/"
      end

      # Parser: fixtures_by_date
      # Parses all files in this directory and returns an array of fixtures with symbolized keys
      def by_date
        by_date_data = []
        target_dir = by_date_dir
        Dir.foreach(target_dir) do |file|
          next if file == '.' or file == '..'
          json_file = File.open(target_dir + file)
          parsed_file = JSON.parse(File.read(json_file))
          fixture_values = parsed_file["api"]["fixtures"].values
          fixture_values.each {|v| by_date_data.push (v.deep_symbolize_keys!)}
        end

        by_date_data
      end

      # Parser: fixture_by_id
      # Parses all files in this directory and returns an array of data wth symbolized keys
      def by_id
        by_id_data = []
        target_dir = by_id_dir
        Dir.foreach(target_dir) do |file|
          next if file == '.' or file == '..'
          json_file = File.open(target_dir + file)
          parsed_file = JSON.parse(File.read(json_file))
          fixture_values = parsed_file["api"]["fixtures"].values
          fixture_values.each { |v| by_id_data.push(v.deep_symbolize_keys!)}
        end

        by_id_data
      end

      # Parser: fixture_by_league
      # Parses all files in this directory and returns an array of data with symbolized keys
      def by_league
        by_league_data = []
        target_dir = by_league_dir
        Dir.foreach(target_dir) do |file|
          next if file =='.' or file =='..'
          json_file = File.open(target_dir + file)
          parsed_file = JSON.parse(File.read(json_file))
          fixture_values = parsed_file["api"]["fixtures"].values
          fixture_values.each { |v| by_league_data.push(v.deep_symbolize_keys!)}
        end

        by_league_data
      end

      # Parser: fixture_by_team
      # Parses all files in target directory and returns array of data with symbolized keys
      def by_team
        by_team_data = []
        target_dir = by_team_dir
        Dir.foreach(target_dir) do |file|
          next if file == '.' or file == '..'
          json_file = File.open(target_dir + file)
          parsed_file = JSON.parse(File.read(json_file))
          fixture_values = parsed_file["api"]["fixtures"].values
          fixture_values.each { |v| by_team_data.push(v.deep_symbolize_keys!)}
        end

        by_team_data
      end

      # Parser: fixture_h2h
      # Parses All files in target directory and returns an array of data with symbolized keys
      def by_h2h
        # Implement Later no current data in directory
      end

      # Parser: fixture_live
      # Parses all files in target directory and returns an array of data with symbolized keys
      def live
        live_data =[]
        target_dir = live_dir
        Dir.foreach(target_dir) do |file|
          next if file == '.' or file == '..'
          json_file = File.open(target_dir + file)
          parsed_file = JSON.parse(File.read(json_file))
          fixture_values = parsed_file["api"]["fixtures"].values
          fixture_values.each { |v| live_data.push(v.deep_symbolize_keys!)}
        end

        live_data
      end
    end
  end
end
