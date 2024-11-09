class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flat = Flat.find(params[:flat_id])
    @booked_dates = @flat.bookings.flat_map do |booking|
      (booking.start_date..booking.end_date).to_a
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat
    if @booking.save
      # redirects to my_bookings
      redirect_to dashboard_path
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
    respond_to do |format|
      if @booking.save
        format.html { redirect_to dashboard_path }
        format.json { render json: {status: "booked"} }
      end
    end
  end

  def deny
    @booking = Booking.find(params[:booking_id])
    @booking.status = 2
    respond_to do |format|
      if @booking.save
        format.html { redirect_to dashboard_path }
        format.json { render json: {status: "denied"} }
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
