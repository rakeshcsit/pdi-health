class Doctor < ActiveRecord::Base
	belongs_to :user, dependent: :destroy

	has_many :patients, through: :manegizations
	has_many :manegizations

	validates :full_name, :email, :phone_number, :address, :state, :zipcode, presence: true
end
