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

  def approve
    @booking = Booking.find(params[:booking_id])
    @booking.status = 1
    if @booking.save
      redirect_to dashboard_path
    end
  end

  def deny
    @booking = Booking.find(params[:booking_id])
    @booking.status = 2
    if @booking.save
      redirect_to dashboard_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
