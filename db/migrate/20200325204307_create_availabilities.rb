class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.references :doctor, foreign_key: true
      t.datetime :datetime_start
      t.datetime :datetime_end
      t.timestamps
    end
  end
end
