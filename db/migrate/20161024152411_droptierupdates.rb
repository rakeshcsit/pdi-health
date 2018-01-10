class Droptierupdates < ActiveRecord::Migration[5.0]
  def change
    drop_table :tier_updates
  end
end
