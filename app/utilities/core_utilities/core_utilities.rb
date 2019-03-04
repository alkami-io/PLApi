# Require file for all utilities
# CoreUtility:DataToJson
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

# APIFootball Utilities
# Connection Utilities
require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"

# Event Utilities
require "#{Rails.root}/app/utilities/api_football/event_utilities/event_downloaders.rb"
require "#{Rails.root}/app/utilities/api_football/event_utilities/event_injectors.rb"
require "#{Rails.root}/app/utilities/api_football/event_utilities/event_parsers.rb"

# Fixture Utilities
require "#{Rails.root}/app/utilities/api_football/fixture_utilities/fixture_downloaders.rb"
require "#{Rails.root}/app/utilities/api_football/fixture_utilities/fixture_injectors.rb"
require "#{Rails.root}/app/utilities/api_football/fixture_utilities/fixture_parsers.rb"

# League Utilities
require "#{Rails.root}/app/utilities/api_football/league_utilities/league_downloaders.rb"
require "#{Rails.root}/app/utilities/api_football/league_utilities/league_injectors.rb"
require "#{Rails.root}/app/utilities/api_football/league_utilities/league_parsers.rb"

# Lineup Utilities
require "#{Rails.root}/app/utilities/api_football/lineup_utilities/lineup_downloaders.rb"
require "#{Rails.root}/app/utilities/api_football/lineup_utilities/lineup_injectors.rb"
require "#{Rails.root}/app/utilities/api_football/lineup_utilities/lineup_parsers.rb"

# Player Utilities
require "#{Rails.root}/app/utilities/api_football/player_utilities/player_downloaders.rb"
require "#{Rails.root}/app/utilities/api_football/player_utilities/player_injectors.rb"
require "#{Rails.root}/app/utilities/api_football/player_utilities/player_parsers.rb"

# Season Utilities
require "#{Rails.root}/app/utilities/api_football/season_utility.rb"

# Standing Utilities
require "#{Rails.root}/app/utilities/api_football/standing_utilities/standing_downloaders.rb"
require "#{Rails.root}/app/utilities/api_football/standing_utilities/standing_injectors.rb"
require "#{Rails.root}/app/utilities/api_football/standing_utilities/standing_parsers.rb"

# Stat Utilities
require "#{Rails.root}/app/utilities/api_football/stat_utilities/stat_downloaders.rb"
require "#{Rails.root}/app/utilities/api_football/stat_utilities/stat_injectors.rb"
require "#{Rails.root}/app/utilities/api_football/stat_utilities/stat_parsers.rb"

# Team Utilities
require "#{Rails.root}/app/utilities/api_football/team_utilities/team_downloaders.rb"
require "#{Rails.root}/app/utilities/api_football/team_utilities/team_injectors.rb"
require "#{Rails.root}/app/utilities/api_football/team_utilities/team_parsers.rb"

# FPL Utilities
require "#{Rails.root}/app/utilities/fpl/connection_utility.rb"
require "#{Rails.root}/app/utilities/fpl/bootstrap_utility.rb"
require "#{Rails.root}/app/utilities/fpl/element_utility.rb"
require "#{Rails.root}/app/utilities/fpl/event_utility.rb"
require "#{Rails.root}/app/utilities/fpl/fixture_utility.rb"
require "#{Rails.root}/app/utilities/fpl/game_setting_utility.rb"
require "#{Rails.root}/app/utilities/fpl/phase_utility.rb"
require "#{Rails.root}/app/utilities/fpl/region_utility.rb"
require "#{Rails.root}/app/utilities/fpl/team_utility.rb"

# MLS Utilities
require "#{Rails.root}/app/utilities/api_football/mls/mls_seasons.rb"
