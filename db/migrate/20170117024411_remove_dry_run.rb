class RemoveDryRun < ActiveRecord::Migration[5.0]
  def change
  	remove_column :instructors, :dry_run_date
  end
end
