class RoomReservationsController < ApplicationController
  before_action :set_room_reservation, only: [:show, :update, :destroy]

  # GET /room_reservations
  def index
    @room_reservations = RoomReservation.all

    render json: @room_reservations
  end

  # GET /room_reservations/1
  def show
    render json: @room_reservation
  end

  # POST /room_reservations
  def create
    @room_reservation = RoomReservation.new(room_reservation_params)

    if @room_reservation.save
      render json: @room_reservation, status: :created, location: @room_reservation
    else
      render json: @room_reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /room_reservations/1
  def update
    if @room_reservation.update(room_reservation_params)
      render json: @room_reservation
    else
      render json: @room_reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /room_reservations/1
  def destroy
    @room_reservation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_reservation
      @room_reservation = RoomReservation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def room_reservation_params
      params.require(:room_reservation).permit(:start, :end, :room_id)
    end
end
