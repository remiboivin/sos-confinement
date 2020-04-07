class CreatePlannings < ActiveRecord::Migration[6.0]
  def change
    create_table :plannings do |t|
      t.references :volunteer, foreign_key: true
      t.date :date_start
      t.date :date_end
      t.time :time_start
      t.time :time_end
    end
  end
end
