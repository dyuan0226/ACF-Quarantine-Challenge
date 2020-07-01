<<<<<<< HEAD
require "test_helper"

describe ChallengesController do
  let(:challenge) { challenges :one }

  it "gets index" do
    get challenges_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_challenge_url
    value(response).must_be :success?
  end

  it "creates challenge" do
    expect {
      post challenges_url, params: { challenge: { category: challenge.category, description: challenge.description, name: challenge.name, num_points: challenge.num_points } }
    }.must_change "Challenge.count"

    must_redirect_to challenge_path(Challenge.last)
  end

  it "shows challenge" do
    get challenge_url(challenge)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_challenge_url(challenge)
    value(response).must_be :success?
  end

  it "updates challenge" do
    patch challenge_url(challenge), params: { challenge: { category: challenge.category, description: challenge.description, name: challenge.name, num_points: challenge.num_points } }
    must_redirect_to challenge_path(challenge)
  end

  it "destroys challenge" do
    expect {
      delete challenge_url(challenge)
    }.must_change "Challenge.count", -1

    must_redirect_to challenges_path
  end
end
=======
require "test_helper"

class ChallengesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @challenge = FactoryBot.create(:challenge)
  end

  test "should get index" do
    get challenges_path
    assert_response :success
    assert_not_nil assigns(:challenges)
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
      post challenges_path, params: { challenge: { name: "Read a book", description: "Read a good book", category: "Lifestyle", num_points: 20 } }
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
    patch challenge_path(@challenge), params: { challenge: { name: "Read a book", description: "Read a good book", category: "Lifestyle", num_points: 20 } }
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
>>>>>>> 7134f2a33a504e014c2751ded7fc17e4dd8ed54b
