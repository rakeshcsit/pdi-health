class AddRelationsToUniversities < ActiveRecord::Migration[5.0]
  def change
    add_column :universities, :rd_id, :integer
  end
end
