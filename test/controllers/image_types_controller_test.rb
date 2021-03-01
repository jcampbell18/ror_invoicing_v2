require 'test_helper'

class ImageTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_type = image_types(:one)
  end

  test "should get index" do
    get image_types_url, as: :json
    assert_response :success
  end

  test "should create image_type" do
    assert_difference('ImageType.count') do
      post image_types_url, params: { image_type: { name: @image_type.name } }, as: :json
    end

    assert_response 201
  end

  test "should show image_type" do
    get image_type_url(@image_type), as: :json
    assert_response :success
  end

  test "should update image_type" do
    patch image_type_url(@image_type), params: { image_type: { name: @image_type.name } }, as: :json
    assert_response 200
  end

  test "should destroy image_type" do
    assert_difference('ImageType.count', -1) do
      delete image_type_url(@image_type), as: :json
    end

    assert_response 204
  end
end
