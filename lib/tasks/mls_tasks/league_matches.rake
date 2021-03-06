require Rails.root.join("app", "utilities", "core_utilities", "core_utilities.rb")

namespace :mls do
  desc "Convert all csv league match data to json"
  task :convert_matches_directory => :environment do
    source_dir = "#{Rails.root}/raw_data/csv_files/mls_data/footystats/league_matches"
    target_dir = "#{Rails.root}/raw_data/json_files/mls_data/footystats/league_matches"

    CoreUtility::CsvToJSON.directory_to_json(source_dir, target_dir)
  end
end
