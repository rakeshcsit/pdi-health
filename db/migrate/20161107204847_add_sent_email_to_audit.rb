class AddSentEmailToAudit < ActiveRecord::Migration
  def change
    add_column :audits, :sent_email, :boolean, :default => false
  end
end
