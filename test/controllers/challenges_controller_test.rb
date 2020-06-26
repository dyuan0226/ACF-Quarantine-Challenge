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
