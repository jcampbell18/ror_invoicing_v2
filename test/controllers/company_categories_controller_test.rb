require 'test_helper'

class CompanyCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_category = company_categories(:one)
  end

  test "should get index" do
    get company_categories_url, as: :json
    assert_response :success
  end

  test "should create company_category" do
    assert_difference('CompanyCategory.count') do
      post company_categories_url, params: { company_category: { name: @company_category.name } }, as: :json
    end

    assert_response 201
  end

  test "should show company_category" do
    get company_category_url(@company_category), as: :json
    assert_response :success
  end

  test "should update company_category" do
    patch company_category_url(@company_category), params: { company_category: { name: @company_category.name } }, as: :json
    assert_response 200
  end

  test "should destroy company_category" do
    assert_difference('CompanyCategory.count', -1) do
      delete company_category_url(@company_category), as: :json
    end

    assert_response 204
  end
end
