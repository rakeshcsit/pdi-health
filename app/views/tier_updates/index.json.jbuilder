json.array!(@tier_updates) do |tier_update|
  json.extract! tier_update, :id, :instructor_id, :old_tier, :new_tier, :notes
  json.url tier_update_url(tier_update, format: :json)
end
