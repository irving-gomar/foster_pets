class Pet < ApplicationRecord
  belongs_to :user

  #Asociaciones
  has_many :bookings
  has_many :services, through: :bookings

  # Validaciones
	validates :breed, :pet_name, :medical_condition, length: { minimum: 3 }
  validates :date_of_birth, :weight, :size, presence:true
end
