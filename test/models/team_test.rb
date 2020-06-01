require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  # Relationship Tests
  should have_many(:users)

end
