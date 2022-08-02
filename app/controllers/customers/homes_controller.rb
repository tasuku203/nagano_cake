class Customers::HomesController < ApplicationController
  def top
    # 制作日の新しいものを４つ取り出す
    @item = Item.order(created_at: :DESC).limit(4)
    
  end
end
