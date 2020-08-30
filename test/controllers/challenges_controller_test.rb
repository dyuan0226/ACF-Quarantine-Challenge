require "test_helper"

class ChallengesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_admin
    @challenge = FactoryBot.create(:challenge)
  end

  test "should get index" do
    get challenges_path
    assert_response :success
    assert_not_nil assigns(:challenges)
    assert_not_nil assigns(:spiritual_challenges)
    assert_not_nil assigns(:physical_challenges)
    assert_not_nil assigns(:social_challenges)
    assert_not_nil assigns(:misc_challenges)
  end

  test "should show challenge" do
    get challenge_path(@challenge)
    assert_response :success
    assert_not_nil assigns(:users_completed)
  end

  test "should get new" do
    get new_challenge_path
    assert_response :success
  end

  test "should create challenge when appropriate" do
    # create valid
    assert_difference('Challenge.count') do
      post challenges_path, params: { challenge: { name: "Read a book", description: "Read a good book", category: "Miscellaneous", num_points: 20 } }
    end
    assert_redirected_to challenge_path(Challenge.last)
  end

  test "should not create challenge when inappropriate" do
    # create invalid
    post challenges_path, params: { challenge: { name: "Read a book", description: "Read a good book", category: "Lifestyle", num_points: -10 } }
    assert_template :new
  end

  test "should get edit" do
    get edit_challenge_path(@challenge)
    assert_response :success
  end

  test "should update challenge when appropriate" do
    # update valid
    patch challenge_path(@challenge), params: { challenge: { name: "Read a book", description: "Read a good book", category: "Miscellaneous", num_points: 20 } }
    assert_equal "Challenge was successfully updated.", flash[:notice]
    assert_redirected_to challenge_path(@challenge)
  end

  test "should not update challenge when inappropriate" do
    # update invalid
    patch challenge_path(@challenge), params: { challenge: { name: "Read a book", description: "Read a good book", category: "Lifestyle", num_points: -10 } }
    assert_template :edit
  end

  test "should not have the ability to destroy challenges" do
    delete challenge_path(@challenge)
    assert_response :missing
  end

end
