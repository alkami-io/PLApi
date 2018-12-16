module ApiFootball
  module ConnectionService
    def self.api_connection
      # Use demo for development purposes to get the api calls set up correctly.
      # @connection = Faraday.new('https://www.api-football.com/demo/api/')
      Faraday.new('https://api-football-v1.p.mashape.com/') do |faraday|
        faraday.headers["X-Mashape-Key"] = ENV["API_FOOTBALL_KEY"]
        faraday.headers["Accept"] = "application/json"
        faraday.adapter  Faraday.default_adapter
      end
    end
  end
end


