require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expense = expenses(:one)
  end

  test "should get index" do
    get expenses_url, as: :json
    assert_response :success
  end

  test "should create expense" do
    assert_difference('Expense.count') do
      post expenses_url, params: { expense: { amount: @expense.amount, company_id: @expense.company_id, expense_category_id: @expense.expense_category_id, image_id: @expense.image_id, invoice_id: @expense.invoice_id, name: @expense.name, pdate: @expense.pdate, quantity: @expense.quantity, receipt_reference: @expense.receipt_reference, subtotal: @expense.subtotal, tax: @expense.tax, tax_include: @expense.tax_include, total: @expense.total, vehicle_id: @expense.vehicle_id } }, as: :json
    end

    assert_response 201
  end

  test "should show expense" do
    get expense_url(@expense), as: :json
    assert_response :success
  end

  test "should update expense" do
    patch expense_url(@expense), params: { expense: { amount: @expense.amount, company_id: @expense.company_id, expense_category_id: @expense.expense_category_id, image_id: @expense.image_id, invoice_id: @expense.invoice_id, name: @expense.name, pdate: @expense.pdate, quantity: @expense.quantity, receipt_reference: @expense.receipt_reference, subtotal: @expense.subtotal, tax: @expense.tax, tax_include: @expense.tax_include, total: @expense.total, vehicle_id: @expense.vehicle_id } }, as: :json
    assert_response 200
  end

  test "should destroy expense" do
    assert_difference('Expense.count', -1) do
      delete expense_url(@expense), as: :json
    end

    assert_response 204
  end
end
