class Api::V2::CompanyCategoriesController < ApplicationController
  before_action :set_company_category, only: [:show, :update, :destroy]

  # GET /company_categories
  def index
    @company_categories = CompanyCategory.all

    render json: @company_categories
  end

  # GET /company_categories/1
  def show
    render json: @company_category
  end

  # POST /company_categories
  def create
    @company_category = CompanyCategory.new(company_category_params)

    if @company_category.save
      render json: @company_category, status: :created, location: @company_category
    else
      render json: @company_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /company_categories/1
  def update
    if @company_category.update(company_category_params)
      render json: @company_category
    else
      render json: @company_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /company_categories/1
  def destroy
    @company_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_category
      @company_category = CompanyCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_category_params
      params.require(:company_category).permit(:name)
    end
end
