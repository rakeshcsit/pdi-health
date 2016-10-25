json.array!(@tiers) do |tier|
  json.extract! tier, :id, :tier, :notes
  json.url tier_url(tier, format: :json)
end
