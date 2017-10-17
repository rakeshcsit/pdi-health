class Patient < ActiveRecord::Base
	belongs_to :user, dependent: :destroy

	has_many :doctors, through: :manegizations
	has_many :manegizations

	has_many :notes

	has_many :test_strip_requests

	has_and_belongs_to_many :reps # probably will only have 1 - but prepare for worst case

	validates :first_name, :last_name, :email, :communication_preferred, :phone_number, :address, :state, :zipcode, presence: true

	# return number of inrs for this month
	def inrs_this_month
		true
	end
end
