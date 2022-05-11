class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
s    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.uptate(item_params)
    redirect_to admin_item(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :image, :introduction, :price, :is_active)
  end

end