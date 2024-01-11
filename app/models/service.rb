class Service < ApplicationRecord
  belongs_to :user

  #Asociaciones
  has_many :bookings

  # Validaciones
	validates :price, :activity, presence: true
end
