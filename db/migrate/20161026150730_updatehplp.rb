class Updatehplp < ActiveRecord::Migration[5.0]
  def change
    change_column :audits, :percent_hp_lp, :string
  end
end
