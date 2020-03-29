class Availability < ApplicationRecord
belongs_to :doctor

has_one :consultation, -> { where(status: "booked") }

validates_with AvailabilityValidator
end
