class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :availabilities
  has_many :consultations, through: :availabilities do
    def booked
      where("availabilities.booked = ?", true)
    end
  end
  has_many :users, through: :consultations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { scope: :last_name }
  validates :specialty, presence: true
  validates :phone_number, presence: true, uniqueness: true, format: {with: /\A((\+)33|0)[1-6]{1}(([0-9]{2}){4})\z/}
  validates :adeli_number, presence: true, uniqueness: true
  validates :status, presence: true
end
