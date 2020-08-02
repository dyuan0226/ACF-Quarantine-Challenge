require "test_helper"

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = FactoryBot.create(:team)
    @user = FactoryBot.create(:user, team: @team)
    @challenge = FactoryBot.create(:challenge)
    @challenge_2 = FactoryBot.create(:challenge, name: "Eat cheese")
    @submission = FactoryBot.create(:submission, user: @user, challenge: @challenge)
    @submission_2 = FactoryBot.create(:submission, user: @user, challenge: @challenge_2)
  end

  test "should get index" do
    get submissions_path
    assert_response :success
  end

  test "should show submission" do
    get submission_path(@submission)
    assert_response :success
  end

  test "should get new" do
    get new_submission_path
    assert_response :success
  end

  test "should create submission when appropriate" do
    # create valid
    assert_difference('Submission.count') do
      @challenge_new = FactoryBot.create(:challenge, name: "Read a book", description: "Read a good book", category: "Miscellaneous", num_points: 20)
      post submissions_path, params: { submission: { user_id: @user.id, challenge_id: @challenge_new.id, date_completed: Date.current } }
    end
    assert_redirected_to submission_path(Submission.last)
  end

  test "should not create submission when inappropriate" do
    # create invalid
    post submissions_path, params: { submission: { user: @user, date_completed: Date.current } }
    assert_template :new
  end

  test "should get edit" do
    get edit_submission_path(@submission)
    assert_response :success
  end

  test "should update submission when appropriate" do
    # update valid
    patch submission_path(@submission), params: { submission: { user: @user, challenge: @challenge, date_completed: Date.current } }
    assert_equal "Submission was successfully updated.", flash[:notice]
    assert_redirected_to submission_path(@submission)
  end

  test "should not update submission when inappropriate" do
    # update invalid
    patch submission_path(@submission_2), params: { submission: { user: @user, challenge: @challenge, date_completed: Date.current + 1 } }
    assert_template :edit
  end

  test "should destroy submission" do
    assert_difference('Submission.count', -1) do
      delete submission_path(@submission)
    end
    assert_redirected_to submissions_path
  end

end
