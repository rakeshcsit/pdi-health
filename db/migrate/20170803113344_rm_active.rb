class RmActive < ActiveRecord::Migration
  def change
  	remove_column :manegizations, :active
  end
end
