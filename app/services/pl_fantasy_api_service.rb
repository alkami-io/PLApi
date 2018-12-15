class PLFantasyApiService
  attr_reader :connection

  def initialize
    @connection = Faraday.new('https://fantasy.premierleague.com/drf/')
  end

  # /bootstrap endpoint
  def all_data
    response = connection.get('bootstrap')
    JSON.parse(response.body)
  end

  def events
    all_data["events"]
  end

  def elements
    all_data["elements"]
  end

  def teams
    all_data["teams"]
  end
end
