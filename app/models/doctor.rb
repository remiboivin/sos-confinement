class Doctor < ApplicationRecord
  has_many :alerts
  has_many :patients, :through => :alert
end
