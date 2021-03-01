require 'test_helper'

class AccessLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @access_level = access_levels(:one)
  end

  test "should get index" do
    get access_levels_url, as: :json
    assert_response :success
  end

  test "should create access_level" do
    assert_difference('AccessLevel.count') do
      post access_levels_url, params: { access_level: { description: @access_level.description, name: @access_level.name } }, as: :json
    end

    assert_response 201
  end

  test "should show access_level" do
    get access_level_url(@access_level), as: :json
    assert_response :success
  end

  test "should update access_level" do
    patch access_level_url(@access_level), params: { access_level: { description: @access_level.description, name: @access_level.name } }, as: :json
    assert_response 200
  end

  test "should destroy access_level" do
    assert_difference('AccessLevel.count', -1) do
      delete access_level_url(@access_level), as: :json
    end

    assert_response 204
  end
end
