json.array!(@sses) do |ss|
  json.extract! ss, :id, :university_id, :ss, :ss_email
  json.url ss_url(ss, format: :json)
end
