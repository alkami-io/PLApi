require 'csv'

module StatBunker
  class PlayerStandings
    attr_reader :page, :comp_id

    def initialize(comp_id)
      @comp_id = comp_id
      @page = Nokogiri::HTML(open("https://www.statbunker.com/competitions/PlayerStandings?comp_id=#{comp_id}"))
    end

    def table_headers
      table_headers = []
      page.xpath("//table[@class='table']/thead/tr/th").each do |header|
        table_headers.push(header.inner_text)
      end
      table_headers[6] = "Yellow"
      table_headers[7] = "Yellow - Red"
      table_headers[8] = "Red"
      table_headers
    end

    def table_data
      table_data = []
      page.xpath("//table[@class='table']/tbody/tr").map do |row|
        table_data.push(row.children)
      end
      table_data
    end

    def compiled_data
      compiled_data = []
      table_data.map do |data|
        compiled_data.push(data.map { |x| x.inner_text})
      end
      compiled_data
    end

    def write_csv
      CSV.open("#{Rails.root}/csv_files/stat_bunker/player_standings_#{comp_id}.csv", "wb", :write_headers => true, :headers => table_headers) do |headers|
        compiled_data.to_a.each {|x| headers << x }
      end
    end
  end
end

