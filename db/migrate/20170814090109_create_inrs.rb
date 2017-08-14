class CreateInrs < ActiveRecord::Migration
  def change
    create_table :inrs do |t|
      t.references :user, index: true
      t.decimal :value
      t.text :note
      t.date :wdate

      t.timestamps
    end
  end
end
