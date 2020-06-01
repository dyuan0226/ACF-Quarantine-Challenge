require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # PROPOSED CHANGES TO THE SPECS:
  # 1. Users -> teams should be 0-many beause new users will not have a team yet (allow_blank for team_id should be set to true)
  # 2. only active users can be in teams
end
