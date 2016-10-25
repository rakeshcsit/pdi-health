json.array!(@lesson_plans) do |lesson_plan|
  json.extract! lesson_plan, :id, :lp, :lp_link
  json.url lesson_plan_url(lesson_plan, format: :json)
end
