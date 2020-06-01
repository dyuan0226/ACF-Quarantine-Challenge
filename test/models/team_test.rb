require 'test_helper'

class TeamTest < ActiveSupport::TestCase
<<<<<<< HEAD
  # PROPOSED CHANGES TO THE SPECS:
  # 1. name should be unique
  # 2. create an active and inactive scope, and make_active and make_inactive methods
  
  # QUESTIONS: 
  # 1. does archived = false?


  # Relationship Tests
  should have_many(:users)
  should have_many(:submissions).through(:users)

  # Validation Tests
  should validate_presence_of(:name)
  should validate_presence_of(:description)

  should allow_value("asdf").for(:name)
  should allow_value("Team 1").for(:name)
  should allow_value("Cell Leaders").for(:name)
  should_not allow_value(1234).for(:name)
  should_not allow_value(1.2).for(:name)
  should_not allow_value(true).for(:name)

  should allow_value("kjdslsfdsjlakjs").for(:description)
  should allow_value("Team for doing stuff").for(:description)
  should allow_value("ACF cell leader team").for(:description)
  should_not allow_value(1234).for(:description)
  should_not allow_value(1.2).for(:description)
  should_not allow_value(true).for(:description)

  # Context
  context "Given context" do 
    setup do 
      create_teams
      create_users
    end 

    teardown do 
      destroy_teams
      destroy_users
    end

    should "not be deleted if users are associated with it, only archived (set to inactive?)" do 
      assert @top_team_active.active
      deny @top_team_active.users.empty?
      deny @top_team_active.destroy
      deny @top_team_active.active
    end

    should "allow teams with no users associated with them to be destroyed" do
      @new_team = FactoryBot.create(:team, name: "new team", description: "we are a new team", active: true)
      assert @new_team.users.empty?
      assert @new_team.destroy 
    end

    should "have a method to determine the total number of points" do 
      assert_equal 5, @top_team_active.total_points
      assert_equal 2, @bottom_team_active.total_points 
      assert_equal 3, @inactive_team.total_points
    end

    should "have a method to determine the top-x scorers in a team" do 
      assert_equal ["Lu"], @top_team_active.top_x_scorers(1).map{|e| e.last_name}
      assert_equal ["Lu", "Yuan"], @top_team_active.top_x_scorers(2).map{|e| e.last_name}
      assert_equal ["Fang", "Ma"], @bottom_team_active.top_x_scorers(1).map{|e| e.last_name}  # what do we want to do if there's a tie for #1? 
      assert_equal ["Fang", "Ma"], @bottom_team_active.top_x_scorers(2).map{|e| e.last_name}
    end

    should "have a method to make active" do 
      inactive_team_1 = FactoryBot.create(:team, name: "whatever", description: "lol", active: false)
      deny inactive_team_1.active 
      inactive_team_1.make_inactive
      assert inactive_team_1.active 
    end

    should "have a method to make inactive" do 
      active_team_1 = FactoryBot.create(:team, name: "whatever", description: "lol", active: true)
      assert active_team_1.active 
      active_team_1.make_inactive
      deny active_team_1.active 
    end

    should "have a scope to find active teams" do 
      assert_equal ["Bottom Team", "Top Team"], Team.active.map{|t| t.name}.sort
    end

    should "have a scope to find active teams" do 
      assert_equal ["Inactive Team"], Team.inactive.map{|t| t.name}.sort
    end

end
