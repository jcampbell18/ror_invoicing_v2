require 'test_helper'

class ExpenseCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expense_category = expense_categories(:one)
  end

  test "should get index" do
    get expense_categories_url, as: :json
    assert_response :success
  end

  test "should create expense_category" do
    assert_difference('ExpenseCategory.count') do
      post expense_categories_url, params: { expense_category: { description: @expense_category.description, name: @expense_category.name } }, as: :json
    end

    assert_response 201
  end

  test "should show expense_category" do
    get expense_category_url(@expense_category), as: :json
    assert_response :success
  end

  test "should update expense_category" do
    patch expense_category_url(@expense_category), params: { expense_category: { description: @expense_category.description, name: @expense_category.name } }, as: :json
    assert_response 200
  end

  test "should destroy expense_category" do
    assert_difference('ExpenseCategory.count', -1) do
      delete expense_category_url(@expense_category), as: :json
    end

    assert_response 204
  end
end
