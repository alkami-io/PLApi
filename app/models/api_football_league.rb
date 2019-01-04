class ApiFootballLeague < ApplicationRecord
  # Model Validators
  validates_presence_of :league_id
  validates_uniqueness_of :league_id
end
