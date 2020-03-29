class Consultation < ApplicationRecord
  belongs_to :availability
  belongs_to :user

  has_one :doctor, through: :availability

  validates :status, presence: true
end
