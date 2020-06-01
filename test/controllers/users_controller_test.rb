require "test_helper"

describe UsersController do
  let(:user) { users :one }

  it "gets index" do
    get users_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_user_url
    value(response).must_be :success?
  end

  it "creates user" do
    expect {
      post users_url, params: { user: { active: user.active, email: user.email, first_name: user.first_name, last_name: user.last_name, password_digest: user.password_digest, role: user.role, team_id: user.team_id, username: user.username } }
    }.must_change "User.count"

    must_redirect_to user_path(User.last)
  end

  it "shows user" do
    get user_url(user)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_user_url(user)
    value(response).must_be :success?
  end

  it "updates user" do
    patch user_url(user), params: { user: { active: user.active, email: user.email, first_name: user.first_name, last_name: user.last_name, password_digest: user.password_digest, role: user.role, team_id: user.team_id, username: user.username } }
    must_redirect_to user_path(user)
  end

  it "destroys user" do
    expect {
      delete user_url(user)
    }.must_change "User.count", -1

    must_redirect_to users_path
  end
end
