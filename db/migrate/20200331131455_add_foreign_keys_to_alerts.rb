class AddForeignKeysToAlerts < ActiveRecord::Migration[6.0]
  def change
    add_column :alerts, :patient_id, :integer
    add_foreign_key :alerts, :patients
    add_column :alerts, :doctor_id, :integer
    add_foreign_key :alerts, :doctors
  end
end
