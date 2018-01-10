class CreateJoinTableDoctorsPatients < ActiveRecord::Migration[5.0]
  def change
    create_join_table :doctors, :patients do |t|
      t.index [:doctor_id, :patient_id]
      t.index [:patient_id, :doctor_id]
      t.boolean :active , :default => true, :null => false
    end
  end
end
