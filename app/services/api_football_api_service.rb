class ApiFootballApiService
  attr_reader :connection

  def initialize
    # Use demo for development purposes to get the api calls set up correctly.
    # @connection = Faraday.new('https://www.api-football.com/demo/api/')
    @connection = Faraday.new('https://api-football-v1.p.mashape.com/') do |faraday|
      faraday.headers["X-Mashape-Key"] = ENV["API_FOOTBALL_KEY"]
      faraday.headers["Accept"] = "application/json"
      faraday.adapter  Faraday.default_adapter
    end
  end

  def seasons
    response = connection.get('seasons')
    JSON.parse(response.body)
  end

  def leagues
    response = connection.get('leagues')
    JSON.parse(response.body)
  end

  def premier_league
    response = connection.get('leagues/league/2')
    JSON.parse(response.body)
  end

  def premier_league_teams
    response = connection.get('teams/league/2')
    JSON.parse(response.body)
  end
end
