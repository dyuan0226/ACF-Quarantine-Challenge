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
