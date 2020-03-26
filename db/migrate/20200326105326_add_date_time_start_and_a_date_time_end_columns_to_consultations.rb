class AddDateTimeStartAndADateTimeEndColumnsToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :datetime_start, :datetime
    add_column :consultations, :datetime_end, :datetime
  end
end
