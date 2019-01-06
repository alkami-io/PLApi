# Require file for all utilities
# CoreUtility:DataToJson
require "#{Rails.root}/app/utilities/core_utilities/data_to_json.rb"

# APIFootball Utilities
require "#{Rails.root}/app/utilities/api_football/connection_utility.rb"

require "#{Rails.root}/app/utilities/api_football/event_utilities/event_downloaders.rb"
require "#{Rails.root}/app/utilities/api_football/event_utilities/event_injectors.rb"
require "#{Rails.root}/app/utilities/api_football/event_utilities/event_parsers.rb"

require "#{Rails.root}/app/utilities/api_football/fixture_utilities/fixture_downloaders.rb"
require "#{Rails.root}/app/utilities/api_football/fixture_utilities/fixture_injectors.rb"
require "#{Rails.root}/app/utilities/api_football/fixture_utilities/fixture_parsers.rb"
\
require "#{Rails.root}/app/utilities/api_football/league_utilities/league_downloaders.rb"
require "#{Rails.root}/app/utilities/api_football/league_utilities/league_injectors.rb"
require "#{Rails.root}/app/utilities/api_football/league_utilities/league_parsers.rb"
\
require "#{Rails.root}/app/utilities/api_football/lineup_utilities/lineup_downloaders.rb"
require "#{Rails.root}/app/utilities/api_football/lineup_utilities/lineup_injectors.rb"
require "#{Rails.root}/app/utilities/api_football/lineup_utilities/lineup_parsers.rb"

require "#{Rails.root}/app/utilities/api_football/player_utility.rb"
require "#{Rails.root}/app/utilities/api_football/season_utility.rb"
require "#{Rails.root}/app/utilities/api_football/standing_utility.rb"
require "#{Rails.root}/app/utilities/api_football/stat_utility.rb"
require "#{Rails.root}/app/utilities/api_football/team_utility.rb"

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
