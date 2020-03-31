class CreateAlerts < ActiveRecord::Migration[6.0]
  def change
    create_table :alerts do |t|
      t.date :date_contact
      t.text :comment, null: true
      t.boolean :is_booked
      t.integer :score_consultation
      t.timestamps
    end
  end
end
