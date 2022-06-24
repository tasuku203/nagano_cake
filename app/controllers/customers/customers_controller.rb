class Customers::CustomersController < ApplicationController
 before_action :authenticate_customer!

  def show
    @customer = current_customer

  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  def confirm
  end

  def withdrawal
    customer = current_customer
    customer.update(is_active: false)
    sign_out
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:is_active,:encrypted_password)
  end
end
