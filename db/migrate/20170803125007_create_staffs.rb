class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.references :user, index: true
      t.string :full_name
      t.string :email

      t.timestamps
    end
  end
end
