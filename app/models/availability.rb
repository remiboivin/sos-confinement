class Availability < ApplicationRecord
belongs_to :doctor

has_one :consultation, -> { where(status: "booked") }

validate :validate_dates

private

  def validate_dates
    datetime_start = DateTime.new(date_start_year, date_start_month, date_start_day, time_start_hour, time_start_minutes)
    datetime_end = DateTime.new(date_end_year, date_end_month, date_end_day, time_end_hour, time_end_minutes)

    if datetime_start.nil?
      errors.add(:datetime_start, "Please enter a start time")
      false
    elsif datetime_end.nil?
      errors.add(:datetime_end, "Please enter an end time")
      false
    elsif datetime_start < DateTime.now
      errors.add(:datetime_start, "Start Date can't be in the past")
      false
    elsif datetime_end < DateTime.now
      errors.add(:datetime_end, "End Date can't be in the past")
      false
    elsif datetime_start >= datetime_end
      errors.add(:datetime_end, "End should be after start")
      false
    end
  end
end
