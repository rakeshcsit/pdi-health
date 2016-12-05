json.array!(@student_feedbacks) do |student_feedback|
  json.extract! student_feedback, :id, :class_code, :week, :student_name, :how_class_week, :pace, :acad_supp, :new_learn, :mastery, :inst_engag, :inst_clarity, :inst_know, :hours_outside, :spend_time_on, :pace_notes, :support_notes, :inst_notes, :add_notes
  json.url student_feedback_url(student_feedback, format: :json)
end
