class CreateStudentFeedbacks < ActiveRecord::Migration
  def change
    create_table :student_feedbacks do |t|
      t.string :class_code
      t.integer :week
      t.string :student_name
      t.integer :how_class_week
      t.integer :pace
      t.integer :acad_supp
      t.integer :new_learn
      t.integer :mastery
      t.integer :inst_engag
      t.integer :inst_clarity
      t.integer :inst_know
      t.string :hours_outside
      t.text :spend_time_on
      t.text :pace_notes
      t.text :support_notes
      t.text :inst_notes
      t.text :add_notes

      t.timestamps
    end
  end
end
