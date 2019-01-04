class ApiFootballFixture < ApplicationRecord
  # Model Validators
  validates_presence_of :fixture_id
  validates_uniqueness_of :fixture_id
end
