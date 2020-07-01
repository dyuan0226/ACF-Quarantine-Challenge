<<<<<<< HEAD
require "test_helper"

describe TeamsController do
  let(:team) { teams :one }

  it "gets index" do
    get teams_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_team_url
    value(response).must_be :success?
  end

  it "creates team" do
    expect {
      post teams_url, params: { team: { active: team.active, description: team.description, name: team.name } }
    }.must_change "Team.count"

    must_redirect_to team_path(Team.last)
  end

  it "shows team" do
    get team_url(team)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_team_url(team)
    value(response).must_be :success?
  end

  it "updates team" do
    patch team_url(team), params: { team: { active: team.active, description: team.description, name: team.name } }
    must_redirect_to team_path(team)
  end

  it "destroys team" do
    expect {
      delete team_url(team)
    }.must_change "Team.count", -1

    must_redirect_to teams_path
  end
end
=======
require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = FactoryBot.create(:team)
  end

  test "should get index" do
    get teams_path
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  test "should show team" do
    get team_path(@team)
    assert_response :success
    assert_not_nil assigns(:team_roster)
  end

  test "should get new" do
    get new_team_path
    assert_response :success
  end

  test "should create team when appropriate" do
    # create valid
    assert_difference('Team.count') do
      post teams_path, params: { team: { name: "Team 1", description: "The first team", active: true } }
    end
    assert_redirected_to team_path(Team.last)
  end

  test "should not create team when inappropriate" do
    # create invalid
    post teams_path, params: { team: { name: "blah", description: "failed team", active: true } }
    assert_template :new
  end

  test "should get edit" do
    get edit_team_path(@team)
    assert_response :success
  end

  test "should update team when appropriate" do
    # update valid
    patch team_path(@team), params: { team: { name: "Team 1", description: "The first team", active: true } }
    assert_equal "Team was successfully updated.", flash[:notice]
    assert_redirected_to team_path(@team)
  end

  test "should not update team when inappropriate" do
    # update invalid
    patch team_path(@team), params: { team: { name: "blah", description: "failed team", active: true } }
    assert_template :edit
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete team_path(@team)
    end
    assert_redirected_to teams_path
  end
  
  test "should not destroy team" do
    @user = FactoryBot.create(:user, first_name: "David", last_name: "Yuan", team: @team, username: "dyuan", role: "admin", email: "dyuan@gmail.com", active: true)
    
    assert_difference('Team.count', 0) do
      delete team_path(@team)
    end
    assert_template :show
  end

end
>>>>>>> 7134f2a33a504e014c2751ded7fc17e4dd8ed54b
