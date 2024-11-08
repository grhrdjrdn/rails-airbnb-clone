class FlatsController < ApplicationController

  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
    if params[:query].present?
      @flats = Flat.search_by_name_and_description(params[:query])
    end
  end

  def show
    @booking = Booking.new
    @booked_dates = @flat.bookings.flat_map do |booking|
      (booking.start_date..booking.end_date).to_a
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    # @flat = Flat.new(flat_params)
    @flat = Flat.new(flat_params.merge(user: current_user))
    # raise
    # puts @flat.errors.full_message
    if @flat.save
      redirect_to flat_path(@flat)
    else
      puts @flat.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :description, :address, photos: [])
  end

end
