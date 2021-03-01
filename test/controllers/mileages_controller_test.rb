require 'test_helper'

class MileagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mileage = mileages(:one)
  end

  test "should get index" do
    get mileages_url, as: :json
    assert_response :success
  end

  test "should create mileage" do
    assert_difference('Mileage.count') do
      post mileages_url, params: { mileage: { drive_date: @mileage.drive_date, end_mileage: @mileage.end_mileage, invoice_id: @mileage.invoice_id, notes: @mileage.notes, project_site_id: @mileage.project_site_id, start_mileage: @mileage.start_mileage, subtotal: @mileage.subtotal, vehicle_id: @mileage.vehicle_id } }, as: :json
    end

    assert_response 201
  end

  test "should show mileage" do
    get mileage_url(@mileage), as: :json
    assert_response :success
  end

  test "should update mileage" do
    patch mileage_url(@mileage), params: { mileage: { drive_date: @mileage.drive_date, end_mileage: @mileage.end_mileage, invoice_id: @mileage.invoice_id, notes: @mileage.notes, project_site_id: @mileage.project_site_id, start_mileage: @mileage.start_mileage, subtotal: @mileage.subtotal, vehicle_id: @mileage.vehicle_id } }, as: :json
    assert_response 200
  end

  test "should destroy mileage" do
    assert_difference('Mileage.count', -1) do
      delete mileage_url(@mileage), as: :json
    end

    assert_response 204
  end
end
