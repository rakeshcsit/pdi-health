class AddActiveToInstructors < ActiveRecord::Migration[5.0]
  def change
    add_column :instructors, :active, :boolean, :default => true

    Instructor.reset_column_information

    Instructor.all.each do |ins|
      puts ins.inspect
      ins.update({:active => true})
    end
  end
end
