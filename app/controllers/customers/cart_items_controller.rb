class Customers::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_item = current_customer.cart_items.all
    @total = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    # cart_item.update(amount: params[:amount])
    redirect_to cart_items_path
  end

  def create
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      #カート内に同じ商品がある場合 :item_idをもとに探す
       @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
       #@cart_itemを定義する
       @cart_item.amount += cart_item_params[:amount].to_i
       #to_iメソッドで文字列を整数に直す
       #@cart_item.amount += params[:cart_item][:amount].to_i　ともかける
       if @cart_item.update(amount: @cart_item.amount)
       #()ないはなくてもいい
       redirect_to cart_items_path
       else
        render :'customers/items/show'
       end
    elsif
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      if @cart_item.save
       redirect_to cart_items_path
      else
       @items= Item.all
        render :'customers/items/index'
      end
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    # cart_items = CartItem.find(params[:id])
    # cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
  params.require(:cart_item).permit(:item_id,:amount)
  end

end
