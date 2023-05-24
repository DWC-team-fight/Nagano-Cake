class Admin::OrdersController < ApplicationController
# 　before_action:authenticate_admin!

  def index
    @order=Order.find(params[:id])
    @customer= @order.customer
    @orders = @customer.orders.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @customer= @order.customer
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      @order_details.update_all(product_order_status: 1)if @order.status == "payment_confirmation"
      flash[:notice] ="更新しました"
      redirect_to admin_root_path(@order)
    else
      flash[:notice] ="失敗しました"
      render "show"
    end

  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
