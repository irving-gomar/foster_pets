class Service < ApplicationRecord
  belongs_to :user

  #Asociaciones
  has_many :bookings
end
