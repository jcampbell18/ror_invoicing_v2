class Api::V2::BidStatusesController < ApplicationController
  before_action :set_bid_status, only: [:show, :update, :destroy]

  # GET /bid_statuses
  def index
    @bid_statuses = BidStatus.all

    render json: @bid_statuses
  end

  # GET /bid_statuses/1
  def show
    render json: @bid_status
  end

  # POST /bid_statuses
  def create
    @bid_status = BidStatus.new(bid_status_params)

    if @bid_status.save
      render json: @bid_status, status: :created, location: @bid_status
    else
      render json: @bid_status.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bid_statuses/1
  def update
    if @bid_status.update(bid_status_params)
      render json: @bid_status
    else
      render json: @bid_status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bid_statuses/1
  def destroy
    @bid_status.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid_status
      @bid_status = BidStatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bid_status_params
      params.require(:bid_status).permit(:name)
    end
end
