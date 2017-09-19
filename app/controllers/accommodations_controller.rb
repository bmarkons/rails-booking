class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: [:show, :update, :destroy, :approve]
  before_action :authenticate_user!

  # GET /accommodations
  def index
    @accommodations = Accommodation.all

    render json: @accommodations
  end

  # GET /accommodations/1
  def show
    render json: @accommodation
  end

  # POST /accommodations
  def create
    unless current_user.role != "manager" || current_user.blocked
      @accommodation = current_user.accommodations.build(accommodation_params)

      if @accommodation.save
        render json: @accommodation, status: :created, location: @accommodation
      else
        render json: @accommodation.errors, status: :unprocessable_entity
      end
    else
      render json: 'Admin blocked you.', status: :unauthorized
    end
  end

  # PATCH/PUT /accommodations/1
  def update
    if @accommodation.update(accommodation_params)
      render json: @accommodation
    else
      render json: @accommodation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accommodations/1
  def destroy
    @accommodation.destroy
  end

  def approve
    if current_user.role == "admin"
      @accommodation.update!(approved: true)
      render json: @accommodation
    else
      render status: :unauthorized
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_accommodation
    @accommodation = Accommodation.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def accommodation_params
    params.require(:accommodation).permit(:name, :description, :address, :average_grade, :latitude, :longitude, :image_url, :approved, :accommodation_type_id, :place_id)
  end
end
