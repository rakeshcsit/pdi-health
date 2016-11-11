class Instructor < ActiveRecord::Base
  belongs_to :university
  has_many :tier_updates
  has_many :audits
  belongs_to :tier

  validates :email, uniqueness: true
end
