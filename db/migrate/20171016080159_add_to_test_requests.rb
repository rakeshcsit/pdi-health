class AddToTestRequests < ActiveRecord::Migration[5.0]
  def change
  	add_column :test_strip_requests, :dealt_with, :boolean, :default => false
  	add_column :test_strip_requests, :communicated_with, :boolean, :default => false

  	#maybe make it so you can say - this has been dealt with and/or patient has been communicated with (basically what I started off with kind of)
  end
end
