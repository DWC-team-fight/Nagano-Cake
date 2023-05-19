class Admins::HomesController < ApplicationController
  def top
    @order_details = OrderDetail.all
  end
end
