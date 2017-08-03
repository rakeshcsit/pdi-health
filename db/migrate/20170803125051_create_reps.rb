class CreateReps < ActiveRecord::Migration
  def change
    create_table :reps do |t|
      t.references :user, index: true
      t.string :full_name
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
