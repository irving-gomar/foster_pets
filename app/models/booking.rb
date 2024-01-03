class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :service

  # Validaciones
	validates :check_in, :check_out, :price, presence: true
end
