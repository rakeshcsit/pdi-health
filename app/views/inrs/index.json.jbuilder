json.array!(@inrs) do |inr|
  json.extract! inr, :id, :references, :value, :note, :wdate
  json.url inr_url(inr, format: :json)
end
