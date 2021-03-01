class Api::V2::ProjectSitesController < ApplicationController
  before_action :set_project_site, only: [:show, :update, :destroy]

  # GET /project_sites
  def index
    @project_sites = ProjectSite.all

    render json: @project_sites
  end

  # GET /project_sites/1
  def show
    render json: @project_site
  end

  # POST /project_sites
  def create
    @project_site = ProjectSite.new(project_site_params)

    if @project_site.save
      render json: @project_site, status: :created, location: @project_site
    else
      render json: @project_site.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /project_sites/1
  def update
    if @project_site.update(project_site_params)
      render json: @project_site
    else
      render json: @project_site.errors, status: :unprocessable_entity
    end
  end

  # DELETE /project_sites/1
  def destroy
    @project_site.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_site
      @project_site = ProjectSite.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_site_params
      params.require(:project_site).permit(:address, :city, :state_id, :zipcode, :access_code, :map_link)
    end
end
