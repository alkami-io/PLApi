require 'csv'

module CSVImportService
  class CSVToJSON
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def convert_to_json
      csv = CSV.new(file, :headers => true, :header_converters => :symbol, :converters => :all)
      csv.to_a.map {|row| row.to_hash }
    end
  end
end
