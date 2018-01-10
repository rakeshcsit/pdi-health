class CreateRds < ActiveRecord::Migration[5.0]
  def change
    create_table :rds do |t|
      t.string :rd
      t.string :rd_email

      t.timestamps
    end
  end
end
