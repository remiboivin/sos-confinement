class Availability < ApplicationRecord
belongs_to :doctor

validates_with AvailabilityValidator
end
