class University < ActiveRecord::Base
  belongs_to :rd
  has_many :instructors
  has_one :student_success_manager 
end
