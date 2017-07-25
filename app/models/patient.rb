class Patient < ActiveRecord::Base
	belongs_to :user, dependent: :destroy

	has_many :doctors, through: :manegizations
	has_many :manegizations

	validates :first_name, :last_name, :email, :communication_preferred, :phone_number, :address, :state, :zipcode, presence: true
end
