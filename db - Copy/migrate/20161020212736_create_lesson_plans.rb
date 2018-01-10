class CreateLessonPlans < ActiveRecord::Migration
  def change
    create_table :lesson_plans do |t|
      t.decimal :lp
      t.text :lp_link

      t.timestamps
    end
  end
end
