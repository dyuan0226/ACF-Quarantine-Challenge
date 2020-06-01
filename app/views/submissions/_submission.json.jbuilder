json.extract! submission, :id, :challenge_id, :user_id, :date_completed, :created_at, :updated_at
json.url submission_url(submission, format: :json)
