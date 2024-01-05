class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #Asociaciones
  has_many :services
  has_many :pets
  has_many :bookings, through: :services
  has_many :bookings, through: :pets

  # Geocoder
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
