class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.references :university, index: true
      t.string :instructor
      t.string :email
      t.string :phone
      t.string :class_code
      t.date :hired_date
      t.date :start_date
      t.date :dry_run_date
      t.boolean :pre_quiz_taken, default: false

      t.timestamps
    end
  end
end
