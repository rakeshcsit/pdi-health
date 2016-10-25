class CreateTiers < ActiveRecord::Migration
  def change
    create_table :tiers do |t|
      t.integer :tier
      t.text :notes

      t.timestamps
    end
  end
end
