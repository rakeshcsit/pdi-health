class Doctor < ActiveRecord::Base
	belongs_to :user, dependent: :destroy

	has_and_belongs_to_many :patients

	validates :full_name, :email, :phone_number, :address, :state, :zipcode, presence: true
end
