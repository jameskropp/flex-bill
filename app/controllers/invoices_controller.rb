class InvoicesController < ApplicationController
  # before_action :authenticate_user
  # before_action :authorize
  before_action :set_user

  def index
    render json: @user.invoices
  end

  def create
    render json: @user.invoices.create!(invoice_params)
  end

  def update
    invoice = Invoice.find(params[:id])
    if invoice.update(invoice_params)
      render json: {status: 200, msg: "Invoice has been updated."}
    end
  end

  #   def destroy
  #     invoice = Invoice.find(params[:id])
  #     if invoice.destroy
  #       render json: {status: 200, msg: "Invoice has been deleted."}
  #     end
  #   end

  def cancel
    invoice = Invoice.find(params[:id])
    if invoice.update(status: "cancelled")
      render json: {status: 200, msg: "Invoice has been cancelled."}
    end
  end

  private

  # Manually setting user for testing purpose, should be set to current_user with authorization
  def set_user
    @user = User.find(1)
  end

  def invoice_params
    params.require(:invoice).permit(:to_email, :project_name, :description, :invoice_type, :total_cost, :status, :sender_name)
  end
end
