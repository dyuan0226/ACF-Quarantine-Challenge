require "test_helper"

describe SubmissionsController do
  let(:submission) { submissions :one }

  it "gets index" do
    get submissions_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_submission_url
    value(response).must_be :success?
  end

  it "creates submission" do
    expect {
      post submissions_url, params: { submission: { challenge_id: submission.challenge_id, date_completed: submission.date_completed, user_id: submission.user_id } }
    }.must_change "Submission.count"

    must_redirect_to submission_path(Submission.last)
  end

  it "shows submission" do
    get submission_url(submission)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_submission_url(submission)
    value(response).must_be :success?
  end

  it "updates submission" do
    patch submission_url(submission), params: { submission: { challenge_id: submission.challenge_id, date_completed: submission.date_completed, user_id: submission.user_id } }
    must_redirect_to submission_path(submission)
  end

  it "destroys submission" do
    expect {
      delete submission_url(submission)
    }.must_change "Submission.count", -1

    must_redirect_to submissions_path
  end
end
