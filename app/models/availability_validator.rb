class AvailabilityValidator < ActiveModel::Validator
  def validate(record)
    datetime_start = DateTime.new(record.date_start_year, record.date_start_month, record.date_start_day, record_time_start_hour, record.time_start_minutes)
    datetime_end = DateTime.new(record.date_end_year, record.date_end_month, record.date_end_day, record_time_end_hour, record.time_end_minutes)

    if datetime_start.nil?
      record.errors << "Please enter a start time"
      false
    elsif datetime_end.nil?
      record.errors << "Please enter an end time"
      false
    elsif datetime_start < DateTime.now
      record.errors << "Start Date can't be in the past"
      false
    elsif datetime_end < DateTime.now
      record.errors << "End Date can't be in the past"
      false
    elsif datetime_start >= datetime_end
      record.errors << "End should be after start"
      false
    end
  end
end
