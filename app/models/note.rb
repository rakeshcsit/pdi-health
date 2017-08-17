class Note < ActiveRecord::Base
  belongs_to :patient

  belongs_to :noteable, :polymorphic => true

  validates :patient_id, :interaction_type, :note, :wdate, presence: true
end
