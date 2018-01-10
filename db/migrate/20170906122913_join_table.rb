class JoinTable < ActiveRecord::Migration[5.0]
  def change
  	create_join_table :reps, :patients do |t|
  	  t.index [:rep_id, :patient_id]
  	  t.index [:patient_id, :rep_id]
  	end
  end
end
