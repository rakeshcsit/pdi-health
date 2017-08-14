class Inr < ActiveRecord::Base
	belongs_to :user, dependent: :destroy
	validates_numericality_of :value, :greater_than_or_equal_to => 0.01, :less_than => 30
end
