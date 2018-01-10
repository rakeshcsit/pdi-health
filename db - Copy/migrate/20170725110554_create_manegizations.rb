class CreateManegizations < ActiveRecord::Migration
  def change
    create_table :manegizations do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.boolean :active, :default => true, :null => false

      t.timestamps
    end

    drop_table :doctors_patients
  end
end
