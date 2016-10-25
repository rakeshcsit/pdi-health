class CreateTierUpdates < ActiveRecord::Migration
  def change
    create_table :tier_updates do |t|
      t.references :instructor, index: true
      t.integer :old_tier
      t.integer :new_tier
      t.text :notes

      t.timestamps
    end
  end
end
