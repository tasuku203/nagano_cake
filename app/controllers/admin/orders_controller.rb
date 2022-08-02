class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    order = Order.find(params[:id])
    if order.update(status: params[:order][:status])
      if order.status == "payment_confirmation"
        order.order_details.each do |order_detail|
         order_detail.update(making_status: 1)
        end
      end
     redirect_to admin_order_path
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

end
