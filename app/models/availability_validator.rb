class AvailabilityValidator < ActiveModel::Validator
  def validate(record)
    if record.datetime_start.nil?
      record.errors[:datetime_start] << "Please enter a start time"
      false
    elsif record.datetime_end.nil?
      record.errors[:datetime_end] << "Please enter an end time"
      false
    elsif record.datetime_start >= record.datetime_end
      record.errors[:datetime_end] << "End time should be after start time"
      false
    end
  end
end
