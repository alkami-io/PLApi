module PLFantasy
  module ConnectionService
    def self.api_connection
      Faraday.new('https://fantasy.premierleague.com/drf/')
    end
  end
end
