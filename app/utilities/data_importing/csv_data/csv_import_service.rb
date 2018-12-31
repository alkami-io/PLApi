require 'csv'
require 'json'

module CSVImportService
  class CSVToJSON
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def convert_to_hash
      csv = CSV.read(file, :headers => true)
      csv.map { |row| row.to_h }
    end

    def write_json_file
      File.open("#{Rails.root}/raw_data/json_files/mls_data/footystats/#{File.basename(file, '.*')}.json","w") do |f|
        f.write(convert_to_hash.to_json)
      end
    end
  end
end
