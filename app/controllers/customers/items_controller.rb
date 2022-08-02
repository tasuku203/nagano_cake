class Customers::ItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  def index
     @items = Item.page(params[:page]).per(8)
    # @items = Item.paginate(page: params[:page], per_page: 5)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
    def item_params
      params.require(:item).permit(:genre_id,:name,:image_id,:price,:introduction)
    end
end

