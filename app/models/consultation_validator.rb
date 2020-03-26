class ConsultationValidator < ActiveModel::Validator
  def validate(record)
    availabilities = record.doctor.availabilities

    if availabilities.empty?
      record.errors[:doctor] << "This doctor isn't available"
      false
    end

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

    existing_availability = availabilities.select do |availability|
      availability.datetime_start == record.datetime_start && availability.datetime_end == record.datetime_end
    end

    if existing_availability.empty?
      record.errors[:doctor] << "This doctor isn't available at this moment"
    else
      true
    end
  end
end
