class LessonPlan < ActiveRecord::Base
  has_many :audits
end
