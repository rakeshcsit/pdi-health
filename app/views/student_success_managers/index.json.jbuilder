json.array!(@student_success_managers) do |student_success_manager|
  json.extract! student_success_manager, :id, :university_id, :ss, :ss_email
  json.url student_success_manager_url(student_success_manager, format: :json)
end
