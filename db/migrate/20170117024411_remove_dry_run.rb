class RemoveDryRun < ActiveRecord::Migration
  def change
  	remove_column :instructors, :dry_run_date
  end
end
