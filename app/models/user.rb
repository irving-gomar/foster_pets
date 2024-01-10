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

  # PG Search
  include PgSearch::Model

  pg_search_scope :global_search,
  against: [ :address],
  associated_against: {
    services: [ :walking, :styling, :feeding, :medication ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
