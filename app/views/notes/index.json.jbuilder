json.array!(@notes) do |note|
  json.extract! note, :id, :patient_id, :interaction_type, :training_meeting, :note, :wdate
  json.url note_url(note, format: :json)
end
