json.array!(@test_strip_requests) do |test_strip_request|
  json.extract! test_strip_request, :id, :patient_id, :how_many_left, :patient_notes
  json.url test_strip_request_url(test_strip_request, format: :json)
end
