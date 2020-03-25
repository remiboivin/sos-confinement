class Availability < ApplicationRecord
belongs_to :doctor
belongs_to :consultation

validates :datetime_start, presence: true
validates :datetime_end, presence: true
end
