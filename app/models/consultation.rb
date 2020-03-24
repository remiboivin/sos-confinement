class Consultation < ApplicationRecord
  belongs_to :psy, class_name: 'User'
  belongs_to :patient, class_name: 'User'

  validates :psy, if: :is_psy?
  validates :patient, if: :is_patient?
  validates :date, presence: true
  validates :time, presence: true

  private

  def is_psy?
    psy.roles.include?("psy")
  end

  def is_patient?
    patient.roles.include?("patient")
  end

end
