class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.references :user, index: true
      t.string :full_name
      t.string :email
      t.string :phone_number
      t.string :fax_number
      t.string :address
      t.string :state
      t.string :zipcode
      t.text :hours

      t.timestamps
    end
  end
end
