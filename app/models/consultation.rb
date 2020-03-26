class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates_with ConsultationValidator
end
