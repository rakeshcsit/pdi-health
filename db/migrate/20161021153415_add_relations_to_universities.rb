class AddRelationsToUniversities < ActiveRecord::Migration
  def change
    add_column :universities, :rd_id, :integer
  end
end
