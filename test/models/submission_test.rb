require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase

  # Relationship Tests
  should belong_to(:challenge)
  should belong_to(:user)

  # Validation Tests
  should validate_presence_of(:user_id)
  should validate_presence_of(:challenge_id)

  should allow_value(7.weeks.ago.to_date).for(:date_completed)
  should allow_value(2.years.ago.to_date).for(:date_completed)
  should allow_value(1.day.ago.to_date).for(:date_completed)
  should allow_value(Date.today.to_date).for(:date_completed)
  should_not allow_value(1.week.from_now.to_date).for(:date_completed)
  should_not allow_value("bad").for(:date_completed)

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

    should "have a callback to set date_completed to the current date" do
      @sub_new = FactoryBot.create(:submission, challenge: @write_poetry, user: @matt_bottom_team)
      assert_not_nil @sub_new.date_completed
      assert_equal @sub_new.date_completed, Date.today.to_date
    end

    should "not be allowed to repeat the same challenge-user pairs" do
      sub1_dup = FactoryBot.build(:submission, challenge: @read_john, user: @david_top_team)
      deny sub1_dup.valid?
    end

  end
end
