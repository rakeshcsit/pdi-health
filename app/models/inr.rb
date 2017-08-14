class Inr < ActiveRecord::Base
	belongs_to :user, dependent: :destroy
	validate :numericality_of_inr

	validates :value, :wdate, presence: true

	def numericality_of_inr
		if value < 0 or value > 50
			errors.add(:value, "INR must be an appropriate value.")
		end

		num_list = value.to_s.split(".")

		if num_list.length > 1
			if num_list[1].length > 1
				errors.add(:value, "INR must have only one decimal max.")
			end
		end
	end
end
