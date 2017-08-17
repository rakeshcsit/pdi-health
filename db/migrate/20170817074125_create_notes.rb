class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :patient, index: true
      t.string :interaction_type
      t.boolean :training_meeting
      t.text :note
      t.date :wdate

      t.timestamps
    end

    add_reference :notes, :noteable, polymorphic: true, index: true
  end
end
