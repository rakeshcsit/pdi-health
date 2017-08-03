json.array!(@staffs) do |staff|
  json.extract! staff, :id, :user_id, :full_name, :email
  json.url staff_url(staff, format: :json)
end
