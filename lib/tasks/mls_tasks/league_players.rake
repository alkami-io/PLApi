require Rails.root.join("app", "utilities", "core_utilities", "core_utilities.rb")

namespace :mls do
  desc "Convert all csv player data to json"
  task :convert_players_directory => :environment do
    source_dir = "#{Rails.root}/raw_data/csv_files/mls_data/footystats/league_players"
    target_dir = "#{Rails.root}/raw_data/json_files/mls_data/footystats/league_players"

    CoreUtility::CsvToJSON.directory_to_json(source_dir, target_dir)
  end
end
