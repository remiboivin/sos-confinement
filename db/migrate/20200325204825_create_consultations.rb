class CreateConsultations < ActiveRecord::Migration[6.0]
  def change
    create_table :consultations do |t|
      t.references :availability, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status, null: false, default: "pending"

      t.timestamps
    end
  end
end

