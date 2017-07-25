class Patient < ActiveRecord::Base
  belongs_to :user

  has_and_belongs_to_many :doctors

  validates :first_name, :last_name, :email, :communication_preferred, :phone_number, :address, :state, :zipcode, presence: true

end
