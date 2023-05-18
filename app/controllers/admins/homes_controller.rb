class Admins::HomesController < ApplicationController
  def top
    @order_details = OrderDetail.all
    @orders = Order.all
  end
end
