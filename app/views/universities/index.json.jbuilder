json.array!(@universities) do |university|
  json.extract! university, :id, :university
  json.url university_url(university, format: :json)
end
