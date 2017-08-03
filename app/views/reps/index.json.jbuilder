json.array!(@reps) do |rep|
  json.extract! rep, :id, :user_id, :full_name, :email, :phone_number
  json.url rep_url(rep, format: :json)
end
