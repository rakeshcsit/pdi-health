class CreateSses < ActiveRecord::Migration
  def change
    create_table :sses do |t|
      t.references :university, index: true
      t.string :ss
      t.string :ss_email

      t.timestamps
    end
  end
end
