json.extract! challenge, :id, :name, :description, :category, :num_points, :created_at, :updated_at
json.url challenge_url(challenge, format: :json)
