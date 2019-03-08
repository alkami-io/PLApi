require 'csv'

module CoreUtility
  module CsvToJSON
    # Write all files in csv directory to JSON
    def self.directory_to_json(source_dir, target_dir)
      file_data = []
      Dir.glob("#{source_dir}/*.csv").each do |csv_file|
        parsed_file = CSV.parse(File.open(csv_file), {headers: true, converters: :numeric})
        parsed_file.by_row.each { |x| file_data.push(x.to_h) }

        File.open("#{target_dir}/#{File.basename(csv_file, '.csv')}.json","w") do |f|
          f.write(file_data.to_json.force_encoding("UTF-8"))
        end

        file_data = []
      end
    end

    # Write individual csv directory to JSON
    def self.individual_file_to_json(options={})

    end
  end
end
