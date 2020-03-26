class ChangeAvailabilityIdColumnOfConsultations < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :consultations, :availabilities
    rename_column :consultations, :availability_id, :doctor_id
    add_foreign_key :consultations, :doctors
  end
end
