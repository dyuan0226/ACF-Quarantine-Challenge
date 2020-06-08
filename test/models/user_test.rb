require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # PROPOSED CHANGES TO THE SPECS:
  # 1. 

  # Clarifications:
  # 1. for the "for_challenge" scope do we want it to be a completed submission or just any submission?
  # 2. for the "for_role" scope role isn't an object so are we just passing in a string?

  # Relationship Tests
  should belong_to(:team)
  should have_many(:submissions)
  should have_many(:challenges).through(:submissions)
  # should have_many(:photos).through(:submissions)  - i'm not sure if this is necessary or makes logical sense, same for challenges

  # Validation Tests
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:username)
  should validate_presence_of(:password)
  should validate_presence_of(:password_confirmation)
  should validate_presence_of(:email)
  should validate_uniqueness_of(:username).case_insensitive()
  should validate_uniqueness_of(:email).case_insensitive()
  should have_secure_password

  should allow_value("Ricky").for(:first_name)
  should allow_value("David").for(:first_name)
  should_not allow_value("asdf").for(:first_name)
  should_not allow_value(1234).for(:first_name)
  should_not allow_value(1.2).for(:first_name)
  should_not allow_value(true).for(:first_name)
  should_not allow_value(nil).for(:first_name)

  should allow_value("Ricky").for(:last_name)
  should allow_value("David").for(:last_name)
  should_not allow_value("asdf").for(:last_name)
  should_not allow_value(1234).for(:last_name)
  should_not allow_value(1.2).for(:last_name)
  should_not allow_value(true).for(:last_name)
  should_not allow_value(nil).for(:last_name)

  should allow_value("kjdslsfdsjlakjs").for(:username)
  should allow_value("rma1").for(:username)
  should allow_value("dyuan20").for(:username)

  should allow_value("admin").for(:role)
  should allow_value("regular").for(:role)
  should_not allow_value(1234).for(:role)
  should_not allow_value(1.2).for(:role)
  should_not allow_value(true).for(:role)
  should_not allow_value("anything else").for(:role)

  should allow_value("ricky-ma-29@gmail.com").for(:email)
  should allow_value("david_yuan_09@gmail.com").for(:email)
  should_not allow_value("dyuan20").for(:email)
  should_not allow_value(1234).for(:email)
  should_not allow_value(1.2).for(:email)
  should_not allow_value(true).for(:email)
  should_not allow_value(nil).for(:email)

  context "Given context" do 
    setup do 
      create_teams
      create_users
    end 

    teardown do 
      destroy_users
      destroy_teams
    end

    should "do nothing" do
      
    end

    # should "require a password for new users" do
    #   bad_user = FactoryBot.build(:user, username: "tank", password: nil)
    #   deny bad_user.valid?
    # end
    
    # should "require passwords to be confirmed and matching" do
    #   bad_user_1 = FactoryBot.build(:user, username: "tank", password: "secret", password_confirmation: nil)
    #   deny bad_user_1.valid?
    #   bad_user_2 = FactoryBot.build(:user, username: "tank", password: "secret", password_confirmation: "sauce")
    #   deny bad_user_2.valid?
    # end
    
    # should "require passwords to be at least four characters" do
    #   bad_user = FactoryBot.build(:user, username: "tank", password: "no", password_confirmation: "no")
    #   deny bad_user.valid?
    # end

    # should "have class method to handle authentication services" do
    #   assert User.authenticate('ed', 'secret')
    #   deny User.authenticate('ed', 'notsecret')
    # end

    # should "automatically set role to regular" do 
    #   unfilled_role = FactoryBot.create(:user, first_name: "Imposter", last_name: "Ma", team: @top_team_active, username: "rma1", email: "rma1@gmail.com", active: true)
    #   assert_equal "regular", unfilled_role.role 
    # end

    # should "not be able to destroy a user, only set to inactive" do   # i'm not too sure if this would work due to saving and reloading to the database or whatnot
    #   @imposter = FactoryBot.create(:user, first_name: "Imposter", last_name: "Ma", team: @top_team_active, username: "rma1", email: "rma1@gmail.com", active: true)
    #   assert @imposter.active 
    #   deny @imposter.destroy 
    #   deny @imposter.active
    # end

    # should "have a method to calculate the number of points of a user" do 
    #   assert_equal 3, @amy_top_team.points
    #   assert_equal 2, @david_top_team.points
    #   assert_equal 1, @matt_bottom_team.points 
    #   assert_equal 0, @inactive_user_1.points 
    # end

    # should "have a method that returns a list of all challenges completed" do 
    #   assert_equal [@sleep_well, @write_poetry], @david_top_team.challenges_completed
    #   assert_equal [@read_john, @sleep_well], @amy_top_team.challenges_completed
    # end

    # should "have a method to make active" do 
    #   deny @inactive_user_1.active 
    #   @inactive_user_1.make_inactive
    #   assert @inactive_user_1.active 
    # end

    # should "have a method to make inactive" do 
    #   assert @inactive_user_1.active 
    #   @inactive_user_1.make_inactive
    #   deny @inactive_user_1.active 
    # end

    # should "have a scope that returns all the users of a given team" do 
    #   assert_equal ["Amy", "David"], User.for_team(@top_team_active).map{|u| u.first_name}.sort
    #   assert_equal ["Matthew", "Ricky"], User.for_team(@bottom_team_active).map{|u| u.first_name}.sort
    # end

    # should "have a scope that returns all the users who have completed a given challenge" do 
    #   assert_equal ["Amy", "David", "Ricky"], User.for_challenge(@read_john).map{|u| u.first_name}.sort
    #   assert_equal ["David", "Ricky"], User.for_challenge(@write_poetry).map{|u| u.first_name}.sort
    # end

    # should "have a scope that returns all the users who match a given role" do 
    #   assert_equal ["Amy", "David"], User.for_role("admin").map{|u| u.first_name}.sort
    #   assert_equal ["David", "inactive", "inactive", "Ricky"], User.for_role("regular").map{|u| u.first_name}.sort
    # end

    # should "have a scope that sorts all users by last name" do 
    #   assert_equal ["Fang", "Lu", "Ma", "One", "Two", "Yuan"], User.by_last_name.map{|u| u.last_name}
    # end

    # should "have a scope that sorts all users by last name" do 
    #   assert_equal ["Amy", "David", "Inactive", "Inactive", "Matthew", "Ricky"], User.by_first_name.map{|u| u.first_name}
    # end

    # should "have a scope that returns all active users" do 
    #   assert_equal ["Amy", "David", "Matthew", "Ricky"], User.active.map{|u| u.first_name}.sort
    # end

    # should "have a scope that returns all inactive users" do 
    #   assert_equal ["Inactive", "Inactive"], User.inactive.map{|u| u.first_name}.sort
    # end

  end
end
