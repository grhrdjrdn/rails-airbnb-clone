class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flat = Flat.find(params[:flat_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat
    if @booking.save
      # redirects to my_bookings
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = current_user.bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
