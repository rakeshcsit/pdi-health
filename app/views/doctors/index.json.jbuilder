json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :user_id, :full_name, :email, :phone_number, :fax_number, :address, :state, :zipcode, :hours
  json.url doctor_url(doctor, format: :json)
end
