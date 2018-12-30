require 'csv'

module FoxSports
  class PlayerStats
    attr_reader :page

    def initialize
      @page = "https://www.foxsports.com/soccer/players?competition=1&season=2018"
    end


  end
end
