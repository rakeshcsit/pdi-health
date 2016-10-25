json.array!(@rds) do |rd|
  json.extract! rd, :id, :rd, :rd_email
  json.url rd_url(rd, format: :json)
end
