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
      @order.name = current_customer.last_name + current_customer.first_name
      #binding.pry
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      #formで送られてくるパラメータをそのまま使うだけなので記述はいらない
    end

     @cart_item = current_customer.cart_items
     @total = 0
     @order.shipping_cost = 800
  end

  def complete
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.customer_id = cart_item.customer_id
        order_detail.price = cart_item.item.price
        order_detail.quantity = cart_item.amount
        order_detail.save
      end
      redirect_to complete_orders_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @order = current_customer.orders.all
  end

  def show
    @order = current_customer.orders.find(params[:id])
　　@order_detail = OrderDetails.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :post_code, :name, :address, :shipping_cost, :total_payment)
  end

  # def order_detail_params
  #   params.require(:order_detail).permit(:item_id,:price,:quantity,:making_status,:order_id)
  # end
end
