require 'test_helper'

class ChallengeTest < ActiveSupport::TestCase

  # Relationship Tests
  should have_many(:submissions)
  should have_many(:users).through(:submissions)

end
