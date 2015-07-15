json.array!(@users) do |user|
  json.extract! user, :id, :name, :age, :sex
  json.url user_url(user, format: :json)
end
