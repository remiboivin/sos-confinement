class CreateConsultations < ActiveRecord::Migration[6.0]
  def change
    create_table :consultations do |t|
      t.references :psy, foreign_key: { to_table: :users }
      t.references :patient, foreign_key: { to_table: :users }
      t.date :date
      t.time :time
      t.timestamps
    end
  end
end
