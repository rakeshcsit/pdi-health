json.array!(@patients) do |patient|
  json.extract! patient, :id, :user_id, :first_name, :middle_initial, :last_name, :email, :qualified, :communication_preferred, :insurance_verification, :prescription_acquired, :phone_number, :address, :state, :zipcode
  json.url patient_url(patient, format: :json)
end
