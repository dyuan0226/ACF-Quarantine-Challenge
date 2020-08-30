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

  # Content Validation
  should validate_attached_of(:content)

  # should validate_content_type_of(:content).allowing('image/png', 'image/gif')
  # should validate_content_type_of(:content).rejecting('text/plain', 'text/xml')

  should validate_size_of(:content).less_than_or_equal_to(14.megabytes)

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

    should "have all the submissions listed chronologically by date_completed" do
      assert_equal [@sub1, @sub7, @sub2, @sub5, @sub6, @sub8, @sub3, @sub4], Submission.chronological
    end

    should "have all the submissions listed alphabetically by challenge name" do
      assert_equal [@sub7, @sub1, @sub6, @sub4, @sub2, @sub5, @sub8, @sub3], Submission.by_challenge
    end

    should "have all the submissions listed alphabetically by user first, last name" do
      assert_equal [@sub5, @sub4, @sub1, @sub2, @sub3, @sub7, @sub6, @sub8], Submission.by_user
    end

    should "have a scope 'for_team' that works" do
      assert_equal 5, Submission.for_team(@top_team_active).size
      assert_equal 3, Submission.for_team(@bottom_team_active).size
    end

    should "have a scope 'for_user' that works" do
      assert_equal 3, Submission.for_user(@david_top_team).size
      assert_equal 2, Submission.for_user(@amy_top_team).size
    end

    should "have a scope 'for_date' that works" do
      assert_equal 2, Submission.for_date(Date.current.to_date).size
      assert_equal 4, Submission.for_date(2.days.ago.to_date).size
    end

    should "have a scope 'for_challenge' that works" do
      assert_equal 3, Submission.for_challenge(@read_john).size
      assert_equal 1, Submission.for_challenge(@memorize_2_tim).size
    end

    should "have a scope 'for_category' that works" do
      assert_equal 4, Submission.for_category("Spiritual").size
      assert_equal 2, Submission.for_category("Miscellaneous").size
    end

    should "have a scope 'for_past_days' that works" do
      assert_equal 2, Submission.for_past_days(1).size
      assert_equal 6, Submission.for_past_days(2).size
      assert_equal 7, Submission.for_past_days(3).size
    end
  end
end
