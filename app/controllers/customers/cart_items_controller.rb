class Customers::CartItemsController < ApplicationController
  def index
    @cart_item = current_customer.cart_items.all

  end

  def update
    @cart_item.update(amount: params[:amount])
    redirect_to cart_items_path
  end

  def create
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
       @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
       @cart_item.amount += cart_item_params[:amount].to_i
       @cart_item.update(amount: @cart_item.amount)
       redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to cart_items_path
    end

  end



  def destroy
  end

  def destroy_all

  end

  private
  def cart_item_params
  params.require(:cart_item).permit(:item_id,:amount)
  end

end
