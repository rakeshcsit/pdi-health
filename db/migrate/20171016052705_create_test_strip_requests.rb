class CreateTestStripRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :test_strip_requests do |t|
      t.references :patient, index: true
      t.integer :how_many_left
      t.text :patient_notes

      t.timestamps
    end
  end
end
