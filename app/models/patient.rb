class Patient < ActiveRecord::Base
	belongs_to :user, dependent: :destroy

	has_many :doctors, through: :manegizations
	has_many :manegizations

	has_many :notes

	has_many :test_strip_requests

	has_and_belongs_to_many :reps # probably will only have 1 - but prepare for worst case

	validates :first_name, :last_name, :email, :communication_preferred, :phone_number, :address, :state, :zipcode, presence: true

	def compliance_history
		first_inr = self.user.inrs.first

		if first_inr
			first_inr_date = first_inr.wdate

			# store
			next_inr_date = first_inr_date
			current_date = Date.today
			period_starts = []

			while next_inr_date <= current_date
				next_date = next_inr_date + 30
				next_inr_date = next_date
				period_starts.push next_date
			end

			# not completely sure about this
			if period_starts.last <= current_date
				period_starts.push period_starts.last + 30
			end

			return period_starts
		else
			return 'Has not reported first INR'
		end
	end

	# return number of inrs for this month
	def inrs_this_month
		true
	end
end
