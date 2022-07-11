json.extract! user, :id, :username, :password, :email, :first_name, :last_name, :location, :dob, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
