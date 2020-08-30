require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_admin
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
      post users_path, params: { user: { first_name: "Bob", last_name: "Ross", team_id: @team.id, username: "bross", admin_password: "password", email: "bross@gmail.com", password: "secret", password_confirmation: "secret" } }
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
    # assert_equal "User was successfully updated.", flash[:notice]
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
