module CoreUtility
  module DataToJSON
    # Write response to JSON file with directory, filename and data to write
    def self.write_to_json(directory, filename, data_to_write)
      File.open("#{Rails.root}/raw_data/json_files/#{directory}/#{filename}.json","w") do |f|
        f.write(data_to_write.force_encoding("UTF-8"))
      end
    end

    # Either write or display data based on wod params passed
    def self.write_or_display_data(options={})
      case options[:wod]
      when "w"
        File.open("#{Rails.root}/raw_data/json_files/#{options[:directory]}/#{options[:filename]}.json","w") do |f|
          f.write(options[:response].body.force_encoding("UTF-8"))
        end
      when "d"
        JSON.parse(options[:response].body)
      end
    end
  end
end
