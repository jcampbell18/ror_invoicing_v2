require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get invoices_url, as: :json
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post invoices_url, params: { invoice: { actual_net: @invoice.actual_net, amount: @invoice.amount, bid_id: @invoice.bid_id, company_id: @invoice.company_id, complete: @invoice.complete, description: @invoice.description, end_date: @invoice.end_date, image_id: @invoice.image_id, images: @invoice.images, interest_amount: @invoice.interest_amount, interest_paid: @invoice.interest_paid, loan_amount: @invoice.loan_amount, loan_paid: @invoice.loan_paid, mileage_id: @invoice.mileage_id, paid: @invoice.paid, paid_checknum: @invoice.paid_checknum, paid_date: @invoice.paid_date, project_cost: @invoice.project_cost, project_site_id: @invoice.project_site_id, receipts: @invoice.receipts, save_tax: @invoice.save_tax, sku_id: @invoice.sku_id, start_date: @invoice.start_date, term_id: @invoice.term_id } }, as: :json
    end

    assert_response 201
  end

  test "should show invoice" do
    get invoice_url(@invoice), as: :json
    assert_response :success
  end

  test "should update invoice" do
    patch invoice_url(@invoice), params: { invoice: { actual_net: @invoice.actual_net, amount: @invoice.amount, bid_id: @invoice.bid_id, company_id: @invoice.company_id, complete: @invoice.complete, description: @invoice.description, end_date: @invoice.end_date, image_id: @invoice.image_id, images: @invoice.images, interest_amount: @invoice.interest_amount, interest_paid: @invoice.interest_paid, loan_amount: @invoice.loan_amount, loan_paid: @invoice.loan_paid, mileage_id: @invoice.mileage_id, paid: @invoice.paid, paid_checknum: @invoice.paid_checknum, paid_date: @invoice.paid_date, project_cost: @invoice.project_cost, project_site_id: @invoice.project_site_id, receipts: @invoice.receipts, save_tax: @invoice.save_tax, sku_id: @invoice.sku_id, start_date: @invoice.start_date, term_id: @invoice.term_id } }, as: :json
    assert_response 200
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete invoice_url(@invoice), as: :json
    end

    assert_response 204
  end
end
