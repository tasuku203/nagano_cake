class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:select_address] == "0"
      @order.post_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      #binding.pry
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      #formで送られてくるパラメータをそのまま使うだけなので記述はいらない
    end
  
   @total = current_customer.cart_item.subtotal
    @order.shipping_cost = "800"
    @order.total_payment = @total + @order.shipping_cost
    


  end

  def complete
  end

  def create
    order = Order.new(order_params)

    order.save
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :post_code, :name, :address)
  end
end
