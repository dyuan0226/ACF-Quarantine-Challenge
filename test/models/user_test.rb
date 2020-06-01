require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # Relationship Tests
  should belong_to(:team)
  should have_many(:submissions)
  should have_many(:challenges).through(:submissions)

end
