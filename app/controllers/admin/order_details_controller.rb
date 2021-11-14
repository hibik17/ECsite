class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail=OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    order=order_detail.order
    # byebug
    if OrderDetail.production_statuses[order_detail.production_status] == 2
      order.update("status":2)
    elsif OrderDetail.where(production_status: 3).count == order.order_details.count
      order.update("status":3)
    end
    redirect_to admin_order_path(order_detail.order)
  end

  private



  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
