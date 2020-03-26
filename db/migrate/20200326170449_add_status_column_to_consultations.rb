class AddStatusColumnToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :status, :string, default: "pending"
  end
end
