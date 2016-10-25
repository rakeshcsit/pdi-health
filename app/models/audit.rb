class Audit < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :lesson_plan
end
