class AccommodationTypesController < ApplicationController
  before_action :set_accommodation_type, only: [:show, :update, :destroy]

  # GET /accommodation_types
  def index
    @accommodation_types = AccommodationType.all

    render json: @accommodation_types
  end

  # GET /accommodation_types/1
  def show
    render json: @accommodation_type
  end

  # POST /accommodation_types
  def create
    @accommodation_type = AccommodationType.new(accommodation_type_params)

    if @accommodation_type.save
      render json: @accommodation_type, status: :created, location: @accommodation_type
    else
      render json: @accommodation_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accommodation_types/1
  def update
    if @accommodation_type.update(accommodation_type_params)
      render json: @accommodation_type
    else
      render json: @accommodation_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accommodation_types/1
  def destroy
    @accommodation_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accommodation_type
      @accommodation_type = AccommodationType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def accommodation_type_params
      params.require(:accommodation_type).permit(:name)
    end
end
