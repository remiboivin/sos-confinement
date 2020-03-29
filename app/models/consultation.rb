class Consultation < ApplicationRecord
  belongs_to :availability
  belongs_to :user

  validates :status, presence: true
end
