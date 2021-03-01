class Api::V2::ImageTypesController < ApplicationController
  before_action :set_image_type, only: [:show, :update, :destroy]

  # GET /image_types
  def index
    @image_types = ImageType.all

    render json: @image_types
  end

  # GET /image_types/1
  def show
    render json: @image_type
  end

  # POST /image_types
  def create
    @image_type = ImageType.new(image_type_params)

    if @image_type.save
      render json: @image_type, status: :created, location: @image_type
    else
      render json: @image_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /image_types/1
  def update
    if @image_type.update(image_type_params)
      render json: @image_type
    else
      render json: @image_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /image_types/1
  def destroy
    @image_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_type
      @image_type = ImageType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def image_type_params
      params.require(:image_type).permit(:name)
    end
end
