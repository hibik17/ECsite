class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @order_details=@order.order_details
  end

  def index
    @orders=Order.all
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    # byebug
    if Order.statuses[order.status]==1
      order.order_details.each do |order_detail|
        order_detail.update("production_status":1)
      end
    end
    redirect_to admin_order_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
