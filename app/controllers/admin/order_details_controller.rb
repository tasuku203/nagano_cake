class Admin::OrderDetailsController < ApplicationController
  # before_action :authenticate_admin!

  def update
    # order_detailのパラメータをもとに一つorder_detailを探してくる
    details = OrderDetail.find(params[:id])
    flag=0
    # 探してきたdetailsのmaiking_statusが更新された場合の分岐
    if details.update(order_detail_params)
      # flagという変数を定義
      flag = 0
      # total という変数を定義 elsif文で使う
      total = 0
      # detilsに紐づいたorderモデルに紐づいたorder_detailをすべてeachでとりだす。
      # その中の一つでもmaikig_statusが2になっていたらfalagを1にする
      details.order.order_details.each do |order_detail|
        if order_detail.making_status == 'manufacturing'
          flag = 1
        elsif order_detail.making_status == 'finish'
          total += 1
        end
      end
      # flagが1ならdetailsにひもづいたorderテーブルのsutatusを2に更新する
      if flag == 1
        details.order.update(status: 2)
      elsif details.order.order_details.count == total
        details.order.update(status: 3)
      end
      redirect_to admin_order_path(details.order.id)
    end
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
