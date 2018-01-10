class RmActive < ActiveRecord::Migration[5.0]
  def change
  	remove_column :manegizations, :active
  end
end
