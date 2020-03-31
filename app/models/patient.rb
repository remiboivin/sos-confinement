class Patient < ApplicationRecord
    has_many :alerts
    has_many :doctors, through: :alerts
end
