require 'csv'

module WhoScored
  class PlayerStatistics
    attr_reader :page

    def initialize
      @page = Nokogiri::HTML(open("https://www.whoscored.com/Regions/252/Tournaments/2/Seasons/7361/Stages/16368/PlayerStatistics/England-Premier-League-2018-2019"))
    end


  end
end
