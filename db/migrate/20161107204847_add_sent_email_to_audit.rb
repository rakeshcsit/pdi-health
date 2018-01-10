class AddSentEmailToAudit < ActiveRecord::Migration[5.0]
  def change
    add_column :audits, :sent_email, :boolean, :default => false
  end
end
