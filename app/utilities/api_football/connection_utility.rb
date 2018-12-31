module ApiFootball
  module ConnectionUtility
    class ApiConnection
      attr_reader :connection

      def initialize
        @connection = Faraday.new("https://api-football-v1.p.rapidapi.com") do |faraday|
          faraday.headers["X-RapidAPI-Key"] = ENV["API_FOOTBALL_KEY"]
          faraday.headers["Accept"] = "application/json"
          faraday.adapter  Faraday.default_adapter
        end
      end
    end
  end
end


