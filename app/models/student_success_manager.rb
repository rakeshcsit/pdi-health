class StudentSuccessManager < ActiveRecord::Base
  belongs_to :university

  #validates :ss_email, uniqueness: true
end
