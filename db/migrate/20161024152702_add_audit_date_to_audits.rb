class AddAuditDateToAudits < ActiveRecord::Migration[5.0]
  def change
    add_column :audits, :audit_date, :date
  end
end
