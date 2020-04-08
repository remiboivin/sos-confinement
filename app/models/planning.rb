class Planning < ApplicationRecord
  belongs_to :volunteer

  validate :validate_dates_and_times

  private

  def validate_dates_and_times
    if date_start.nil?
      errors.add(:date_start, "Please enter a start date")
      false
    elsif date_end.nil?
      errors.add(:date_end, "Please enter an end date")
      false
    elsif time_start.nil?
      errors.add(:time_start, "Please enter a start time")
      false
    elsif time_end.nil?
      errors.add(:time_end, "Please enter an end time")
      false
    elsif date_start < Date.today
      errors.add(:date_start, "Start Date can't be in the past")
      false
    elsif date_end < Date.today
      errors.add(:date_end, "End Date can't be in the past")
      false
    elsif date_start > date_end
      errors.add(:date_end, "End should be after start")
      false
    elsif date_start == Date.today && time_start.hour < Time.now.hour
      errors.add(:time_start, "Start time can't be in the past")
      false
    elsif date_start == Date.today && time_end.hour < Time.now.hour
      errors.add(:time_end, "End time can't be in the past")
      false
    elsif time_start >= time_end
      errors.add(:time_end, "Time end should be after time start")
      false
    elsif (time_end - time_start)/60 != 60
      errors.add(:time_end, "The availability should be 1h")
      false
    end
  end
end
