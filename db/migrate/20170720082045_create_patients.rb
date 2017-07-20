class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.references :user, index: true
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.string :email
      t.boolean :qualified
      t.string :communication_preferred
      t.boolean :insurance_verification
      t.boolean :prescription_acquired
      t.string :phone_number
      t.string :address
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
