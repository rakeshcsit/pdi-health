class Rep < ActiveRecord::Base
  belongs_to :user

  has_many :notes, :as => :noteable, dependent: :destroy

  has_and_belongs_to_many :patients
end
