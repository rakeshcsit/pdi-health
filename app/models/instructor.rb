class Instructor < ActiveRecord::Base
  belongs_to :university
  has_many :tier_updates
  has_many :audits
end
