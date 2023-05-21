class Admins::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page])
  end
end
