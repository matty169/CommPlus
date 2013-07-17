json.array!(@users) do |user|
  json.extract! user, :name, :description, :rating
  json.url user_url(user, format: :json)
end