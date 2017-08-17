class Patient < ActiveRecord::Base
	belongs_to :user, dependent: :destroy

	has_many :doctors, through: :manegizations
	has_many :manegizations

	has_many :notes

	validates :first_name, :last_name, :email, :communication_preferred, :phone_number, :address, :state, :zipcode, presence: true

	# return number of inrs for this month
	def inrs_this_month
		true
	end
end
