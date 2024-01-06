class Pet < ApplicationRecord
  belongs_to :user

  # Foto
  has_many_attached :photos

  #Asociaciones
  has_many :bookings
  has_many :services, through: :bookings

  # Validaciones
	validates :breed, :pet_name, :description, length: { minimum: 3 }
  validates :breed, :pet_name, :description, :date_of_birth, :weight, :size, presence:true
end
