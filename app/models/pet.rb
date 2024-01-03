class Pet < ApplicationRecord
  belongs_to :user

  #Asociaciones
  has_many :bookings
  has_many :services, through: :bookings
end
