class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customer = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path(customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:email,:first_name,:last_name,:first_name_kana,:last_name_kane, :postal_code,:address,:telephone_number,:is_active)
  end
end
