require 'test_helper'

class ChallengeTest < ActiveSupport::TestCase

  # Relationship Tests
  should have_many(:submissions)
  should have_many(:users).through(:submissions)

  # Validation Tests
  should validate_presence_of(:name)
  should validate_presence_of(:num_points)
  should validate_presence_of(:category)

  should validate_numericality_of(:num_points).is_greater_than(0)
  should allow_value(10).for(:num_points)
  should allow_value(20).for(:num_points)
  should allow_value(100).for(:num_points)
  should_not allow_value(nil).for(:num_points)
  should_not allow_value("bad").for(:num_points)
  should_not allow_value(0).for(:num_points)
  should_not allow_value(-5).for(:num_points)
  should_not allow_value(3.5).for(:num_points)
  should_not allow_value(-7.8).for(:num_points)

  # Modify when we come up with the categories
  should allow_value("Spiritual").for(:category)
  should allow_value("Physical").for(:category)
  should allow_value("Social").for(:category)
  should allow_value("Miscellaneous").for(:category)
  should_not allow_value("Anything else").for(:category)
  should_not allow_value(5).for(:category)

  context "Given context" do
    setup do
      create_teams
      create_users
      create_challenges
      create_submissions
    end

    teardown do
      destroy_submissions
      destroy_challenges
      destroy_users
      destroy_teams
    end

    should "not be deleted if it has a submission" do
      @chore_tracker.destroy
      assert @chore_tracker.destroyed?

      @read_john.destroy
      @read_john.reload
      deny @read_john.destroyed?
      @write_poetry.destroy
      @write_poetry.reload
      deny @write_poetry.destroyed?
    end

    should "list challenges alphabetically" do
      assert_equal [@chore_tracker, @memorize_2_tim, @read_john, @sleep_well, @write_poetry], Challenge.alphabetical
    end

    should "have a scope 'for_user_completed' that works" do
      assert_equal 3, Challenge.for_user_completed(@david_top_team).size
      assert_equal [@read_john, @sleep_well, @write_poetry], Challenge.for_user_completed(@david_top_team)

      assert_equal 2, Challenge.for_user_completed(@amy_top_team).size
      assert_equal [@read_john, @sleep_well], Challenge.for_user_completed(@amy_top_team)

      assert_equal 0, Challenge.for_user_completed(@matt_bottom_team).size
    end

    should "have a scope 'for_user_incomplete' that works" do
      assert_equal 2, Challenge.for_user_incomplete(@david_top_team).size
      assert_equal [@memorize_2_tim, @chore_tracker], Challenge.for_user_incomplete(@david_top_team)

      assert_equal 3, Challenge.for_user_incomplete(@amy_top_team).size
      assert_equal [@memorize_2_tim, @chore_tracker, @write_poetry], Challenge.for_user_incomplete(@amy_top_team)

      assert_equal 5, Challenge.for_user_incomplete(@matt_bottom_team).size
      assert_equal Challenge.all, Challenge.for_user_incomplete(@matt_bottom_team)
    end

    should "have a scope 'for_category' that works" do
      assert_equal 2, Challenge.for_category("Spiritual").size
      assert_equal [@memorize_2_tim, @read_john], Challenge.for_category("Spiritual").alphabetical

      assert_equal 1, Challenge.for_category("Physical").size
      assert_equal [@sleep_well], Challenge.for_category("Physical").alphabetical
    end
  end

end
