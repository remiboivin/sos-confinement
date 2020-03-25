class CreateConsultations < ActiveRecord::Migration[6.0]
  def change
    create_table :consultations do |t|
      t.references :user, foreign_key: true
      t.references :availability, foreign_key: true
      t.timestamps
    end
  end
end

