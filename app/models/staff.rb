class Staff < ActiveRecord::Base
  belongs_to :user

  has_many :notes, :as => :noteable, dependent: :destroy

end
