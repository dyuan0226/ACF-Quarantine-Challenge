require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # PROPOSED CHANGES TO THE SPECS:
  # 1. Users -> teams should be 0-many beause new users will not have a team yet (allow_blank for team_id should be set to true) and
  # 2. users can be in many teams and could be associated with archived teams that they were in previously
  # 3. only active users can be in an active team
  # 4. unsure if password should be required
  # 5. usernames should be unique

  # Clarifications:
  # 1. "only archived by the user that created it" - means that only users can delete their own stuff (ability.rb), and there should be a callback before_destroy that denys the destroy and instead sets to inactive
  # 2. again, assuming archived = inactive?
  # 3. "list all challenges completed" = return a list of all challenges completed?

  # Relationship Tests
  should have_many(:teams)
  should have_many(:submissions)
  # should have_many(:challenges).through(:submissions)  - i'm not sure if this is necessary or makes logical sense, same for photos

  # Validation Tests
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:username)
  # should validate_presence_of(:password)
  # should validate_presence_of(:password_confirmation) - i'm not sure if this is how it works lol, didn't need to validate presence of password for phase 5
  should validate_presence_of(:email)

  should allow_value("asdf").for(:first_name)
  should allow_value("Ricky").for(:first_name)
  should allow_value("David").for(:first_name)
  should_not allow_value(1234).for(:first_name)
  should_not allow_value(1.2).for(:first_name)
  should_not allow_value(true).for(:first_name)
  should_not allow_value(nil).for(:first_name)

  should allow_value("asdf").for(:last_name)
  should allow_value("Ricky").for(:last_name)
  should allow_value("David").for(:last_name)
  should_not allow_value(1234).for(:last_name)
  should_not allow_value(1.2).for(:last_name)
  should_not allow_value(true).for(:last_name)
  should_not allow_value(nil).for(:last_name)

  should allow_value("kjdslsfdsjlakjs").for(:username)
  should allow_value("rma1").for(:username)
  should allow_value("dyuan20").for(:username)
  should_not allow_value(1234).for(:username)
  should_not allow_value(1.2).for(:username)
  should_not allow_value(true).for(:username)
  should_not allow_value(nil).for(:username)

  should allow_value("ricky-ma-29@gmail.com").for(:email)
  should allow_value("david_yuan_09@gmail.com").for(:email)
  should_not allow_value("dyuan20").for(:email)
  should_not allow_value("ricky.ma.20@gmail.com").for(:email) # i think periods are not allowed in emails..
  should_not allow_value(1234).for(:email)
  should_not allow_value(1.2).for(:email)
  should_not allow_value(true).for(:email)
  should_not allow_value(nil).for(:email)

  context "Given context" do 
    setup do 
      create_users
    end 

    teardown do 
      destroy_users
    end

    should "validate the uniqueness of usernames" do 
      repeat_uname = FactoryBot.build(:user, first_name: "Imposter", last_name: "Yuan", team: @top_team_active, username: "dyuan", role: "admin", email: "dyuan20@gmail.com", active: true)
      deny repeat_uname.valid?
    end

    should "validate the uniqueness of emails" do 
      repeat_email = FactoryBot.build(:user, first_name: "Imposter", last_name: "Yuan", team: @top_team_active, username: "dyuan20", role: "admin", email: "dyuan@gmail.com", active: true)
      deny repeat_email.valid?
    end

    should "automatically set role to regular" do 
      unfilled_role = FactoryBot.create(:user, first_name: "Imposter", last_name: "Ma", team: @top_team_active, username: "rma1", email: "rma1@gmail.com", active: true)
      assert_equal "regular", unfilled_role.role 
    end

    should "not be able to destroy a user, only set to inactive" do   # i'm not too sure if this would work due to saving and reloading to the database or whatnot
      @imposter = FactoryBot.create(:user, first_name: "Imposter", last_name: "Ma", team: @top_team_active, username: "rma1", email: "rma1@gmail.com", active: true)
      assert @imposter.active 
      deny @imposter.destroy 
      deny @imposter.active
    end

    should "have a method to calculate the number of points of a user" do 
      assert_equal 3, @amy_top_team.points
      assert_equal 2, @david_top_team.points
      assert_equal 1, @matt_bottom_team.points 
      assert_equal 0, @inactive_user_1.points 
    end

    should "have a method that returns a list of all challenges completed" do 
      # to be implemented with challenges sets
    end

    should "have a method to make active" do 
      deny @inactive_user_1.active 
      @inactive_user_1.make_inactive
      assert @inactive_user_1.active 
    end

    should "have a method to make inactive" do 
      assert @kimberly_inactive_team.active 
      @kimberly_inactive_team.make_inactive
      deny @kimberly_inactive_team.active 
    end

    should "have scope tests, but im too lazy to write them right now" do 
    end

  end
end
