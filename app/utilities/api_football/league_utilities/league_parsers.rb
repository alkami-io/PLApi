module ApiFootball
  module LeagueUtility
    class LeagueParsers
      attr_reader :leagues_dir,
                  :by_country_season_dir,
                  :by_id_dir,
                  :by_season_dir

      def initialize
        root_dir = "#{Rails.root}/raw_data/json_files/epl_data/api_football"
        @leagues_dir = "#{root_dir}/leagues/"
        @by_id_dir = "#{root_dir}/leagues_by_id/"
        @by_season_dir = "#{root_dir}/leagues_by_season/"
        @by_country_season_dir = "#{root_dir}/leagues_by_country_season/"
      end

      # Parser: leagues_by_country_season
      # Parses all files in this directory and returns an array of leagues with symbolized keys
      def by_country_season_parser
        by_country_season_data = []
        target_dir = by_country_season_dir
        Dir.foreach(target_dir) do |file|
          next if file == '.' or file == '..'
          json_file = File.open(target_dir + file)
          parsed_file = JSON.parse(File.read(json_file))
          league_values = parsed_file["api"]["leagues"].values
          league_values.each {|v| by_country_season_data.push(v.deep_symbolize_keys!)}
        end

        by_country_season_data
      end
    end
  end
end
