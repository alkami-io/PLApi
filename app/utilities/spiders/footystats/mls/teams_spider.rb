require 'csv'

module FootyStats
  module MLS
    class Teams
      attr_reader :page, :season
      def initialize(season)
        @season = season
        @page = Nokogiri::HTML(open("https://footystats.org/usa/mls/#{season}/overview"))
      end

      def table_headers
        # Header Legend
        # GF: Goals For
        # GA: Goals Against
        # GD: Goals Difference
        # CS: Clean Sheets
        # BTTS: Both Teams To Score
        # FTS: Fail To Score
        # YC/RC: Yellow Cards / Red Cards
        # AVG: Average Goals Per Match

        [
          "Rank",
          "Crest",
          "Team",
          "Matches",
          "Win",
          "Draw",
          "Loss",
          "GF",
          "GA",
          "GD",
          "Pts",
          "Last 5",
          "PPG",
          "CS",
          "BTTS",
          "FTS",
          "YC / RC",
          "Corners / Match",
          "1.5+Over 1.5 (1.5+)",
          "2.5+Over 2.5 (2.5+)",
          "AVG"
        ]
      end

      def table_data
        table_data = []
        page.xpath("//table[@class='full-league-table table-sort col-sm-12 mobify-table']/tbody/tr").map do |row|
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
        CSV.open("#{Rails.root}/csv_files/footystats/mls/league_overview_#{season}.csv", "wb", :write_headers => true, :headers => table_headers) do |headers|
          compiled_data.to_a.each { |x| headers << x }
        end
      end
    end
  end
end
