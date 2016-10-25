class Droptierupdates < ActiveRecord::Migration
  def change
    drop_table :tier_updates
  end
end
