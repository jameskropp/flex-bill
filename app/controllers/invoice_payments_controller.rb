class InvoicePaymentsController < ApplicationController
  # before_action :authenticate_user
  # before_action :authorize
  before_action :set_invoice, only: [:index, :create]

  def index
    render json: @invoice.invoice_payments
  end

  def create
    payment = @invoice.invoice_payments.create!(payment_params)
    if payment.paid
      @invoice.update(status: "paid")
    end

    render json: @invoice
  end

  #   def destroy
  #     payment = InvoicePayment.find(params[:id])
  #     if payment.destroy
  #       render json: {status: 200, msg: "Invoice has been deleted."}
  #     end
  #   end

  private

  def set_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end

  def payment_params
    params.require(:payment).permit(:amount, :paid)
  end
end
