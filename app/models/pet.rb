class Pet < ApplicationRecord
  belongs_to :user

  # Foto
  has_many_attached :photos

  #Asociaciones
  has_many :bookings
  has_many :services, through: :bookings

  # Validaciones
	validates :breed, :name, length: { minimum: 2 }
  validates :description, length: { minimum: 50 }
  validates :breed, :name, :description, :date_of_birth, :weight, :size, presence:true
end
