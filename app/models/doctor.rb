class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :availabilities
  has_many :consultations, through: :availabilities
  has_many :users, through: :availabilities

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { scope: :last_name }
  validates :specialty, presence: true
  validates :phone_number, presence: true
  validates :adeli_number, presence: true
  validates :status, presence: true
end
