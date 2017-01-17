json.array!(@instructors) do |instructor|
  json.extract! instructor, :id, :university_id, :instructor, :email, :phone, :class_code, :hired_date, :start_date, :pre_quiz_taken
  json.url instructor_url(instructor, format: :json)
end
