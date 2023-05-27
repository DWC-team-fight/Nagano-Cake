class Admin::OrderDetailsController < ApplicationController

  # before_action :authenticate_admin!

  def update
    puts params[:id]
    @order_detail =OrderDetail.find(params[:id])
    @order =@order_detail.order
    if @order_detail.update(order_detail_params)
        # byebug
        if @order_detail.product_order_status == "working"
          @order.update(status: 2)
        elsif @order.order_details.where(product_order_status:"製作完了").count == @order.order_details.count
          @order.update(status: 3)
        end
        flash[:notice] ="更新しました"
        redirect_to admin_order_path(@order)
    else
      flash[:alert] ="失敗しました"
      render "admin/orders/show"
    end

  end


  private
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :product_id, :once_price, :quantity, :product_order_status)
  end
end
