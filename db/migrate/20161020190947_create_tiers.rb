class CreateTiers < ActiveRecord::Migration[5.0]
  def change
    create_table :tiers do |t|
      t.integer :tier
      t.text :notes

      t.timestamps
    end
  end
end
