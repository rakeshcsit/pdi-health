json.array!(@analysts) do |analyst|
  json.extract! analyst, :id, :name, :email
  json.url analyst_url(analyst, format: :json)
end
