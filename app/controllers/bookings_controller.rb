class BookingsController < ApplicationController
  def index
    @bookings = current_user.pets.map(&:bookings).flatten
  end

  def new
    @booking = Booking.new
    @pets = current_user.pets
    @service = Service.find(params[:service_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.service = Service.find(params[:service_id])
    @booking.price = @booking.service.price * (@booking.check_out - @booking.check_in).to_i

    @booking.save!
    redirect_to bookings_path
  end

  def show
    @booking = Booking.find(params[:id])
    @pet = @booking.pet
    @service = @booking.service
  end

  def edit
    @booking = Booking.find(params[:id])
    @pet = @booking.pet
    @service = @booking.service
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    @booking.price = @booking.service.price * (@booking.check_out - @booking.check_in).to_i
    @booking.save
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private 

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :pet_id)
  end
end
