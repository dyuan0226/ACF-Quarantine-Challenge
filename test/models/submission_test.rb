require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase

  # Relationship Tests
  should belong_to(:challenge)
  should belong_to(:user)

end
