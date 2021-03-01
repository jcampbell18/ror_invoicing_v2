require 'test_helper'

class ProjectSitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_site = project_sites(:one)
  end

  test "should get index" do
    get project_sites_url, as: :json
    assert_response :success
  end

  test "should create project_site" do
    assert_difference('ProjectSite.count') do
      post project_sites_url, params: { project_site: { access_code: @project_site.access_code, address: @project_site.address, city: @project_site.city, map_link: @project_site.map_link, state_id: @project_site.state_id, zipcode: @project_site.zipcode } }, as: :json
    end

    assert_response 201
  end

  test "should show project_site" do
    get project_site_url(@project_site), as: :json
    assert_response :success
  end

  test "should update project_site" do
    patch project_site_url(@project_site), params: { project_site: { access_code: @project_site.access_code, address: @project_site.address, city: @project_site.city, map_link: @project_site.map_link, state_id: @project_site.state_id, zipcode: @project_site.zipcode } }, as: :json
    assert_response 200
  end

  test "should destroy project_site" do
    assert_difference('ProjectSite.count', -1) do
      delete project_site_url(@project_site), as: :json
    end

    assert_response 204
  end
end
