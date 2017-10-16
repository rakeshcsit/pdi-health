class TestStripRequest < ActiveRecord::Base
  belongs_to :patient

  validates :how_many_left, :patient_notes, presence: true
end
