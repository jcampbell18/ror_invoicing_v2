require 'test_helper'

class BidStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bid_status = bid_statuses(:one)
  end

  test "should get index" do
    get bid_statuses_url, as: :json
    assert_response :success
  end

  test "should create bid_status" do
    assert_difference('BidStatus.count') do
      post bid_statuses_url, params: { bid_status: { name: @bid_status.name } }, as: :json
    end

    assert_response 201
  end

  test "should show bid_status" do
    get bid_status_url(@bid_status), as: :json
    assert_response :success
  end

  test "should update bid_status" do
    patch bid_status_url(@bid_status), params: { bid_status: { name: @bid_status.name } }, as: :json
    assert_response 200
  end

  test "should destroy bid_status" do
    assert_difference('BidStatus.count', -1) do
      delete bid_status_url(@bid_status), as: :json
    end

    assert_response 204
  end
end
