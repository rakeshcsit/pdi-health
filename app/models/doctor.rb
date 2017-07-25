class Doctor < ActiveRecord::Base
	belongs_to :user, dependent: :destroy

	has_many :patients, through: :manegizations
	has_many :manegizations

	validates :full_name, :email, :phone_number, :address, :state, :zipcode, presence: true

	# grab all the patients where the doctor_id is not associated with them
	def edit_patient_options
		sql = "SELECT * 
		FROM patients 
		WHERE id NOT IN (SELECT patient_id FROM manegizations WHERE doctor_id = #{self.id})"

		Patient.find_by_sql(sql)   
	end
end
