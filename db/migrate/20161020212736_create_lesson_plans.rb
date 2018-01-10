class CreateLessonPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_plans do |t|
      t.decimal :lp
      t.text :lp_link

      t.timestamps
    end
  end
end
