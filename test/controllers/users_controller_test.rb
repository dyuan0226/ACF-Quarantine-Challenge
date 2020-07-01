<<<<<<< HEAD
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
=======
require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = FactoryBot.create(:team)
    @user = FactoryBot.create(:user, team: @team)
  end

  test "should get index" do
    get users_path
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should show user" do
    get user_path(@user)
    assert_response :success
    assert_not_nil assigns(:user_submissions)
  end

  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should create user when appropriate" do
    # create valid
    assert_difference('User.count') do
      post users_path, params: { user: { first_name: "John", last_name: "Smith", team: @team, username: "js023", role: "admin", email: "blah@yahoo.com", active: true } }
    end
    assert_redirected_to user_path(User.last)
  end

  test "should not create user when inappropriate" do
    # create invalid
    post users_path, params: { user: { first_name: "David", last_name: "Yuan", team: @team, username: "dyuan", role: "admin", email: "fakeemail", active: true } }
    assert_template :new
  end

  test "should get edit" do
    get edit_user_path(@user)
    assert_response :success
  end

  test "should update user when appropriate" do
    # update valid
    patch user_path(@user), params: { user: { first_name: "David", last_name: "Yuan", team: @team, username: "dyuan", role: "admin", email: "dyuan@gmail.com", active: true } }
    assert_equal "User was successfully updated.", flash[:notice]
    assert_redirected_to user_path(@user)
  end

  test "should not update user when inappropriate" do
    # update invalid
    patch user_path(@user), params: { user: { first_name: "David", last_name: "Yuan", team: @team, username: "dyuan", role: "admin", email: "fakeemail", active: true } }
    assert_template :edit
  end

  test "should not have the ability to destroy users" do
    assert_difference('User.count', 0) do
      delete user_path(@user)
    end
    assert_template :show
  end

end
>>>>>>> 7134f2a33a504e014c2751ded7fc17e4dd8ed54b
