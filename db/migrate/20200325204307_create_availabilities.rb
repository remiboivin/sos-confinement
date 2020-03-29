class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.references :doctor, foreign_key: true

      t.string :status, null: false, default: ""
      t.integer :date_start_year, null: false, default: 0
      t.integer :date_start_month, null: false, default: 0
      t.integer :date_start_day, null: false, default: 0
      t.integer :time_start_hour, null: false, default: 0
      t.integer :time_start_minutes, null: false, default: 0
      t.integer :date_end_year, null: false, default: 0
      t.integer :date_end_month, null: false, default: 0
      t.integer :date_end_day, null: false, default: 0
      t.integer :time_end_hour, null: false, default: 0
      t.integer :time_end_minutes, null: false, default: 0

      t.timestamps
    end
  end
end
