class Updatehplp < ActiveRecord::Migration
  def change
    change_column :audits, :percent_hp_lp, :string
  end
end
