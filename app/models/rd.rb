class Rd < ActiveRecord::Base
  has_many :universities

  validates :rd_email, uniqueness: true
end
