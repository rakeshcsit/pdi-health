class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
  after_initialize :set_default_role, :if => :new_record?

  enum role: [:patient, :doctor, :field_rep, :staff, :admin]

  def set_default_role
    self.role ||= :patient
  end

end
