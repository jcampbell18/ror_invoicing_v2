class Api::V2::MileagesController < ApplicationController
  before_action :set_mileage, only: [:show, :update, :destroy]

  # GET /mileages
  def index
    @mileages = Mileage.all

    render json: @mileages
  end

  # GET /mileages/1
  def show
    render json: @mileage
  end

  # POST /mileages
  def create
    @mileage = Mileage.new(mileage_params)

    if @mileage.save
      render json: @mileage, status: :created, location: @mileage
    else
      render json: @mileage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mileages/1
  def update
    if @mileage.update(mileage_params)
      render json: @mileage
    else
      render json: @mileage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mileages/1
  def destroy
    @mileage.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mileage
      @mileage = Mileage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mileage_params
      params.require(:mileage).permit(:project_site_id, :vehicle_id, :invoice_id, :drive_date, :start_mileage, :end_mileage, :subtotal, :notes)
    end
end
