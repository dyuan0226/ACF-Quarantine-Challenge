json.extract! user, :id, :first_name, :last_name, :team_id, :username, :password_digest, :role, :email, :active, :created_at, :updated_at
json.url user_url(user, format: :json)
